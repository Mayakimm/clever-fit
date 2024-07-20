class WorkoutExercisesController < ApplicationController
  def show
    @workout_exercise = WorkoutExercise.find(params[:id])
    # @workout_all_exercises = @workout.workout_exercises
    @current_workout_exercises = @workout_exercise.workout.workout_exercises
    @current_index = @current_workout_exercises.find_index(@workout_exercise)
    @current_exercise = @current_workout_exercises[@current_index].exercise
    @max_index = @current_workout_exercises.count - 1
    # @current_workout_exercise_id = params[:id].to_i
    # until @current_workout_exercise_id == @workout.workout_exercises.last.id - 1
    #   @next_workout_exercise = @workout.workout_exercises.find(@current_workout_exercise_id+1)
    #   break unless @next_workout_exercise
    # end
    # @next_exercise = @next_workout_exercise.exercise
    @workout = @workout_exercise.workout
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_by(date: Date.today)
  end

  def stop
    @workout_exercise = WorkoutExercise.find(params[:id])
    @profile = current_user.profile
    @day_summary = @profile.day_summaries.find_by(date: Date.today)
    @day_summary.update(end_time: Time.current)
    redirect_to summary_workout_path(@workout_exercise.workout)
  end

  def next_set
    # render json: {data: 'test'}
  end

  private

end
