class MembershipsController < ApplicationController

  def new
    @user = User.find_by(:id => session[:user_id])
  end

  def create
    membership = Membership.new
    membership.user_id = params["user_id"]
    membership.project_id = params["project_id"]
    membership.save
    redirect_to :back, notice: "Member Added to Project"
  end

end
