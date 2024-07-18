class WorkoutExercisesController < ApplicationController
  def show
    @workout = Workout.find(params[:workout_id])
    @current_workout_exercise = @workout.workout_exercises.find(params[:id])
    @current_exercise = @current_workout_exercise.exercise
    # raise
  end
end
