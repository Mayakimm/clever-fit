class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :set_workouts

  private

  def set_workouts
    @workouts = Workout.all
  end
end
