class WorkoutsController < ApplicationController
  def summary
    @workout = Workout.find(params[:id])
    @exercises = @workout.exercises
    @duration = (@workout.end_time - @workout.start_time) / 3600
  end
end
