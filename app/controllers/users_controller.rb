class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password_digest"] = BCrypt::Password.create(params["password"])
    if @user.save
      session["user_id"] = @user["id"]
      redirect_to places_path
    else
      render :new
    end
  end
end

