class TasksController < ApplicationController


  def index
    @task_list = Task.all.order('due asc')
    @user = User.find_by(:id => session[:user_id])
  end

  def show
    @task = Task.find_by(:id => params[:task_id])
  end

  def new
  end

  def create
    task = Task.new
    task.project_id = params["project_id"]
    task.name = params["name"]
    task.due = params["due"]
    task.save
    redirect_to "/tasks"
  end

 def edit
    @task = Task.find_by(:id => params[:task_id])
  end

  def update
    task = Task.find_by(:id => params[:task_id])
    task.name = params["name"]
    task.project_id = params["project_id"]
    task.name = params["name"]
    task.due = params["due"]
    task.save
    redirect_to "/tasks"
  end

 def destroy
    task = Task.find_by(:id => params[:task_id])
    task.destroy
    redirect_to "/tasks", notice: "Task has been deleted"
  end

end
