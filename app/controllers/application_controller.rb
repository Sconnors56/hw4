class ApplicationController < ActionController::Base
  before_action :current_user

  private

  def current_user
    @current_user = User.find_by(id: session["user_id"])
  end

  def require_login
    unless @current_user
      flash[:notice] = "You must log in first."
      redirect_to login_path
    end
  end
end

