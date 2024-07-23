class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]


  def home
    @img_sources = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQUkUalpMEX6rmV97y5I_7K-fGHKkNlJ83Hug&s",
      "https://i0.pickpik.com/photos/426/559/606/sport-fitness-training-sporty-preview.jpg",
      "https://img.goodfon.com/original/2560x1707/7/81/poza-figura-fitnes-shtanga-trenirovka-vorkaut-workout-fitn-2.jpg",
      "https://cdn10.picryl.com/photo/1981/09/03/a-recruit-from-the-physical-conditioning-platoon-does-weight-lifting-exercises-390008-1024.jpg"]
    @rand_img = @img_sources.sample
    # @rand_img = "brand.png"

    # Workout status of the day
    @today_date = Date.today.day
    @today_day = Date.today.strftime("%a")

    # Workout info
    @workout_exercises = WorkoutExercise.all
    @workout_names = @workout_exercises.map { |workout_exercise| workout_exercise.workout.name }.uniq
    @exercises = Exercise.all
    @exercises_category = @exercises.flat_map(&:workout_exercises)
    @grouped_workout_exercises = @exercises_category.group_by(&:workout_id)

    @type_workout = @grouped_workout_exercises.map { |grouped_workout_exercise| Workout.find(grouped_workout_exercise.first) }
    # Profile and group classes (if user is logged in and has a profile)
    if user_signed_in? && current_user.profile.present?
      @profile = current_user.profile
      @groupe_classes = GroupClass.where(city: @profile.city)
    else
      # Handle case where user is not logged in or doesn't have a profile
      @profile = nil
      @groupe_classes = []  # Ensure @groupe_classes is initialized as an empty array
      @events = Event.all
    end

    start_date = params.fetch(:start_date, Date.today).to_date

    # For a monthly view:
    @events = Event.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

    # Or, for a weekly view:
    @events = Event.where(start_time: start_date.beginning_of_week..start_date.end_of_week)
    @date_range = (start_date.beginning_of_week..start_date.end_of_week)
    @day_summaries = DaySummary.where(profile: @profile, date: @date_range).pluck(:date, :status).to_h
    #@date_of_summaries = DaySummary.find_by(date: Date.today).date
  end

  def index
    @workout_types = Workout.distinct.pluck(:workout_type)
    @workout_names = @workout_exercises.map {|workout_exercise| workout_exercise.workout.name}.uniq
    #class.all
    @profile = Profile.find(current_user.id)
    @groupe_classes = GroupClass.where(city: @profile.city)
    # For a monthly view:
    start_date = params.fetch(:start_date, Date.today).to_date
    @workouts = Workout.where(starts_at: start_date.beginning_of_week..start_date.end_of_week)
  end
end
