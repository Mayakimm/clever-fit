class WorkoutExercisesController < ApplicationController

  def summary
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercise
    @start_time = datetime
    @end_time = datetime
    @duration = (@endtime - @start_time) / 3600
  end
end
