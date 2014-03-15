class MembershipsController < ApplicationController

  def new
  end

  def create
    membership = Membership.new
    membership.user_id = params["user_id"]
    membership.project_id = params["project_id"]
    membership.save
    redirect_to :back, notice: "New Membership Created"
  end

end
