  class ProjectsController < ApplicationController

  def new
  end

  def newupdate
  end

  def create
    project = Project.new
    project.name = params["name"]
    project.save
    redirect_to "/tasks/new", notice: "New Project Created"
  end

  # def creedit
  #   project = Project.new
  #   project.name = params["name"]
  #   project.save
  #   redirect_to "/", notice: "New Project Created"
  # end

  def destroy
    project = Project.find_by(:id => params[:project_id])
    project.destroy
    redirect_to "/tasks", notice: "Project and all associated tasks have been deleted"
  end

end
