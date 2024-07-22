class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :display_workouts

  private

  def display_workouts
    @workouts = Workout.all.first(5)
  end
end
