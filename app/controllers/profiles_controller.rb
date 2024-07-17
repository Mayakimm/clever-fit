class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def edit
    @profile = current_user.profile || current_user.build_profile
  end

  def update
    @profile = current_user.profile || current_user.build_profile(profile_params)

    if @profile.update(profile_params)
      redirect_to root_path, notice: 'Thank you! Profile was successfully updated! :D'
    else
      render :edit
    end
  end

  def show
    @profile = current_user.profile
  end

  def complete
    @workout = Workout.find(params[:id])
    current_user_profile = current_user.profile

    xp_earned = calculate_xp_for_workout_completion(@workout)

    current_user_profile.current_xp += xp_earned
    current_user_profile.save

    current_user_profile.check_and_update_level

    redirect_to @workout, notice: "Workout completed! You earned #{xp_earned} XP."
  end

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :gender, :goal, :address, :height, :weight)
  end

  def calculate_xp_for_workout_completion(workout)
    case workout.workout_type
    when 'Push', 'Pull', 'Legs', 'Freestyle'
      50
    when 'Cardio'
      100
    else
      0
    end
  end
end
