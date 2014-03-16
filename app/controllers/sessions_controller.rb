class SessionsController < ApplicationController

  def new
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Until we meet again TaskMaster"
  end

  def create
    user = User.find_by(:first_name => params[:fname])
    if user.present?
      if user.password == params[:pwd]
        session[:user_id] = user.id
        redirect_to root_url, notice: "Welcome TaskMaster"
      else
        redirect_to root_url, notice: "Wrong Password."
      end
    else
      redirect_to root_url, notice: "Unknown user."
    end
  end

end
