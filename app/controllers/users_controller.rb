class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new
    user.first_name = params["first_name"]
    user.last_name = params["last_name"]
    user.email = params["email"]
    user.password = params["password"]
    user.save
    redirect_to "/"
  end

  def show
    @user = User.find_by(:id => params[:user_id])
    if @user.id != session[:user_id]
      redirect_to root_url, notice: "Nice try"
    end
  end
end
