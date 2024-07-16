class WorkoutsController < ApplicationController
  def summary
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises

    @duration = (@workout.end_time - @workout.start_time) / 60 # in minutes

    @total_kg_lifted = @exercises.sum(:kg)
    @calories_burnt = total_calories_burnt

    @exercise_detail = @exercises.map do |exercise|
      workout_exercise = WorkoutExercise.find_by(exercise: exercise, workout: @workout)
      {
        name: exercise.name,
        volume: workout_exercise.volume,
        weight: workout_exercise.kg
        # pr: exercise.pr
      }
    end
  end

  private

  def calculate_calories_burnt(workout_exercises, profile)
    age = profile.age
    height = profile.height # in cm
    weight = profile.weight # in kg
    gender = profile.gender
    duration = @duration # in minutes

    bmr = if gender == 'male'
            10 * weight + 6.25 * height - 5 * age + 5
          else
            10 * weight + 6.25 * height - 5 * age - 161
          end

    met_values = {
      'running' => 9.8,
      'cycling' => 7.5,
      'swimming' => 8.0,
      'weightlifting' => 3.0,
    }

    total_calories_burnt = workout_exercises.sum do |workout_exercise|
      met_value = workout_exercise.exercise.met_value
      duration_in_hours = duration / 60.0
      calories_burnt = (met_value * weight * duration_in_hours)
      calories_burnt
    end

    total_calories_burnt
  end

  def check_pr(exercise, current_weight, user)
    max_weight = WorkoutExercise.joins(:workout)
                                .where(workouts: { user_id: user.id }, exercise: exercise)
                                .maximum(:kg)
    current_weight > max_weight ? 'PR' : nil
  end
end
