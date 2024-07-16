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

  private

  def profile_params
    params.require(:profile).permit(:name, :age, :gender, :goal, :address, :height, :weight)
  end
end
