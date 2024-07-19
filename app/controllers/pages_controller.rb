class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @img_sources = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUkUalpMEX6rmV97y5I_7K-fGHKkNlJ83Hug&s",
      "https://i0.pickpik.com/photos/426/559/606/sport-fitness-training-sporty-preview.jpg",
      "https://img.goodfon.com/original/2560x1707/7/81/poza-figura-fitnes-shtanga-trenirovka-vorkaut-workout-fitn-2.jpg",
      "https://cdn10.picryl.com/photo/1981/09/03/a-recruit-from-the-physical-conditioning-platoon-does-weight-lifting-exercises-390008-1024.jpg"]
    @rand_img = @img_sources.sample

    # Workout status of the day
    @today_date = Date.today.day
    @today_day = Date.today.strftime("%a")

    # Workout info
    @workout_exercises = WorkoutExercise.all
    @workout_names = @workout_exercises.map { |workout_exercise| workout_exercise.workout.name }.uniq

    # Profile and group classes (if user is logged in and has a profile)
    if user_signed_in? && current_user.profile.present?
      @profile = current_user.profile
      @groupe_classes = GroupClass.where(city: @profile.city)
    else
      # Handle case where user is not logged in or doesn't have a profile
      @profile = nil
      @groupe_classes = []  # Ensure @groupe_classes is initialized as an empty array
    end
  end

  def index
    @workout_types = Workout.distinct.pluck(:workout_type)
    @workout_names = @workout_exercises.map {|workout_exercise| workout_exercise.workout.name}.uniq
    #class.all
    @profile = Profile.find(current_user.id)
    @groupe_classes = GroupClass.where(city: @profile.city)

    start_date = params.fetch(:start_date, Date.today).to_date
    @workouts = Workout.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
  end

end
