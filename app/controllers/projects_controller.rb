  class ProjectsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(:id => session[:user_id])
    project = Project.new
    project = user.projects.create(:name =>params["name"])
    if project.valid? and project.save
      redirect_to "/tasks/new", notice: "Project successfully created!"
    else
      redirect_to :back, notice: project.errors.full_messages.join('. ')
    end
  end

  def destroy
    project = Project.find_by(:id => params[:project_id])
    project.destroy
    redirect_to "/tasks", notice: "Project and all associated tasks have been deleted"
  end

end
