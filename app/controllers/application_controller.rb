class ApplicationController < ActionController::Base
  def authenticate_admin!
    authenticate_user!
    redirect_to root_path, notice: 'You do not have privileges to set up the temperatures' unless current_user.admin
  end
end

