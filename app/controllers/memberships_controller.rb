class MembershipsController < ApplicationController

  def new
    @user = User.find_by(:id => session[:user_id])

  end

  def create
    membership = Membership.new
    membership.user_id = params["user_id"]
    membership.project_id = params["project_id"]
    if membership.valid? and membership.save
      flash[:notice] = "Member Added to Project"
    else
      flash[:notice] = membership.errors.full_messages.join('. ')
    end
    redirect_to :back
  end

  # def destroy
  #   membership = Membership.find_by(:id => params[:membership_id])
  #   membership.destroy
  #   redirect_to :back, notice: "User removed from project"
  # end

end
