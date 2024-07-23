class ExercisesController < ApplicationController
  def index
    @exercises = Exercise.all
    @workouts = Workout.includes(workout_exercises: :exercise).all
  end

  def show
    @exercise = Exercise.find(params[:id])
  end
end
