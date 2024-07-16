class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super do |user|
      user.build_profile(profile_params)
      user.save
    end
  end

  private

  def profile_params
    params.require(:user).require(:profile).permit(:name, :age, :gender, :height, :weight, :goals)
  end
end
