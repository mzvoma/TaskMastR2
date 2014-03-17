class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.email = params["email"]
    user.password = params["password"]
    if user.valid? and user.save
      redirect_to "/login", notice: "Welcome to TaskMastR! Please Login Below"
    else
      redirect_to :back, notice: user.errors.full_messages.join('. ')
    end

  end

  def show
    @user = User.find_by(:id => params[:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "You can only be you - don't try to be someone else!"
    end
  end
end
