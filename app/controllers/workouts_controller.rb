class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :overview, :start, :description, :summary, :freestyle, :add_exercise, :remove_exercise]

  def freestyle
    @exercises = Exercise.all
    @in_freestyle_mode = params[:from_freestyle].present?
  end

  def add_exercise
    exercise = Exercise.find(params[:exercise_id])
    @workout_exercise = @workout.workout_exercises.build(exercise: exercise, kg: params[:kg], volume: params[:volume])
    if @workout_exercise.save
      redirect_to workout_path(@workout, from_freestyle: params[:from_freestyle] || 'false'), notice: 'Exercise added successfully! :D'
    else
      redirect_to freestyle_workout_path(@workout, from_freestyle: params[:from_freestyle] || 'false'), alert: 'Failed to add exercise.:('
    end
  end

  def remove_exercise
    @workout_exercise = @workout.workout_exercises.find_by(exercise_id: params[:exercise_id])
    if @workout_exercise&.destroy
      redirect_to workout_path(@workout, from_freestyle: params[:from_freestyle]), notice: 'Exercise removed successfully! :D'
    else
      redirect_to workout_path(@workout, from_freestyle: params[:from_freestyle]), alert: 'Failed to remove exercise.'
    end
  end

  def index
    @workouts = Workout.all.first(5)
  end

  def show
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
    @muscle_groups = @workout_exercises.map { |workout_exercise| workout_exercise.exercise.muscle_group }.uniq

    @in_freestyle_mode = params[:from_freestyle].present?
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
    @day_summary.update(start_time: Time.current, calories_burnt: 0, end_time: nil, last_update_time: nil)
    redirect_to workout_exercise_path(@workout_exercise)
  end

  def description
    @workout = Workout.find(params[:id])
    @workout_exercises = @workout.workout_exercises
    @workout_exercise = @workout_exercises.first
    @in_freestyle_mode = params[:from_freestyle].present?
  end

  def summary
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises

    @duration = (@workout.end_time - @workout.start_time) / 60 # in minutes
    @summary_today = current_user.profile.day_summaries.find_by(date: Date.today)
    @end_time_today = @summary_today.end_time
    @start_time_today = @summary_today.start_time
    @duration_today = ((@end_time_today - @start_time_today)/ 60).to_i
    @calories_burnt_today = @summary_today.calories_burnt.round(2)
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

    current_user.profile.add_workout_xp(@total_kg_lifted, @duration_today)

    @calories_burnt = calculate_calories_burnt(@workout.workout_exercises)
  end

  private

  def set_workout
    @workout = Workout.find(params[:id])
  end

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
