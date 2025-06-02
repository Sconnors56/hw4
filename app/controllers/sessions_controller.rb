
class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "You've logged in."
        redirect_to places_path
      else
        flash["notice"] = "Unsuccessful login."
        redirect_to login_path
      end
    else
      flash["notice"] = "Unsuccessful login."
      redirect_to login_path
    end
  end

  def destroy
    flash["notice"] = "Goodbye."
    session["user_id"] = nil
    redirect_to login_path
  end
end

  