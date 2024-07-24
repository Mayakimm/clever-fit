class SessionsController < ApplicationController
  def destroy
    reset_session
    flash[:notice] = "You have logged out successfully."
    redirect_to home_path
  end
end