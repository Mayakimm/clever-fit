class WorkoutsController < ApplicationController
  def index
    @workouts = Workout.all
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
    @muscle_groups = @workout_exercises.map {|workout_exercise| workout_exercise.exercise.muscle_group}.uniq
  end

  def overview
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises.includes(:exercise_category)
    @duration = (@workout.end_time - @workout.start_time) / 60 # in minutes
    @workout_exercise = @workout.workout_exercises.first
  end

  def start
    @workout = Workout.find(params[:id])
    @workout_exercise = @workout.workout_exercises.first
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_or_create_by(date: Date.today)
    @day_summary.start_time = nil
    @day_summary.update(start_time: Time.current) unless @day_summary.start_time
    redirect_to workout_exercise_path(@workout_exercise)
  end

  def description
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
    @workout_exercise = @workout_exercises.first
  end

  def summary
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises

    @duration = (@workout.end_time - @workout.start_time) / 60 # in minutes
    @summary_today = current_user.profile.day_summaries.find_by(date: Date.today)
    @end_time_today = @summary_today.end_time
    @start_time_today = @summary_today.start_time
    @duration_today = ((@end_time_today - @start_time_today)/ 60).to_i
    @total_kg_lifted = @exercises.sum(:kg)
    @pr_count = 0

    @exercise_detail = @exercises.map do |exercise|
      workout_exercise = WorkoutExercise.find_by(exercise: exercise, workout: @workout)
      pr = check_pr(exercise, workout_exercise.kg, @workout.user)
      @pr_count += 1 if pr == 'PR'

      {
        name: exercise.name,
        volume: workout_exercise.volume * workout_exercise.set,
        weight: workout_exercise.kg,
        pr: pr
      }
    end

    @calories_burnt = calculate_calories_burnt(@workout.workout_exercises)
  end

  private

  def workout_params
    params.require(:workout).permit(:name, :workout_type, :user_id, :start_time, :end_time)
  end

  def calculate_calories_burnt(workout_exercises)
    profile = current_user.profile
    age = profile.age
    height = profile.height # in cm
    user_weight = profile.weight # in kg
    gender = profile.gender
    duration = @duration # in minutes

    bmr = if gender == 'male'
            10 * user_weight + 6.25 * height - 5 * age + 5
          else
            10 * user_weight + 6.25 * height - 5 * age - 161
          end

    met_values = {
      'running' => 9.8,
      'cycling' => 7.5,
      'swimming' => 8.0,
      'weightlifting' => 3.0
    }

    total_calories_burnt = workout_exercises.sum do |workout_exercise|
      met_value = workout_exercise.exercise.met_value
      exercise_weight = workout_exercise.kg
      duration_in_hours = duration / 60.0
      calories_burnt = (met_value * exercise_weight * duration_in_hours / 10)
      calories_burnt
    end

    total_calories_burnt
  end

  def check_pr(exercise, current_weight, user)
    max_weight = WorkoutExercise.joins(:workout)
                                .where(workouts: { user: user }, exercise: exercise)
                                .maximum(:kg)
    current_weight > max_weight ? 'PR' : nil
  end
end
