class WorkoutExercisesController < ApplicationController
  def show
    @workout_exercise = WorkoutExercise.find(params[:id])
    # @workout_all_exercises = @workout.workout_exercises
    @current_workout_exercises = @workout_exercise.workout.workout_exercises
    @current_exercise = @current_workout_exercises.first.exercise
    # @current_workout_exercise_id = params[:id].to_i
    # until @current_workout_exercise_id == @workout.workout_exercises.last.id - 1
    #   @next_workout_exercise = @workout.workout_exercises.find(@current_workout_exercise_id+1)
    #   break unless @next_workout_exercise
    # end
    # @next_exercise = @next_workout_exercise.exercise
    #
    # raise
  end

  def next_set
    # render json: {data: 'test'}
  end
end
