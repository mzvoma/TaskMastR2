class TasksController < ApplicationController

  def index
    @task_list = Task.all.order('due asc')
    @user = User.find_by(:id => session[:user_id])
  end

  def show
    @task = Task.find_by(:id => params[:task_id])
  end

  def new
    @user = User.find_by(:id => session[:user_id])
  end

  def create
    task = Task.new
    task.project_id = params["project_id"]
    task.name = params["name"]
    task.due = params["due"]
    task.completed = false
    if task.valid? and task.save
      redirect_to "/tasks", notice: "Task successfully created!"
    else
      redirect_to :back, notice: task.errors.full_messages.join('. ')
    end
  end

 def edit
    @user = User.find_by(:id => session[:user_id])
    @task = Task.find_by(:id => params[:task_id])
  end

  def update
    user = User.find_by(:id => session[:user_id])
    task = Task.find_by(:id => params[:task_id])
    task.name = params["name"]
    task.project_id = params["project_id"]
    task.due = params["due"]
    task.completed = params["completed"]
    if task.valid? and task.save
      redirect_to "/tasks", notice: "Task successfully updated!"
    else
      redirect_to :back, notice: task.errors.full_messages.join('. ')
    end

  end

  def updatestatus
    task = Task.find_by(:id => params[:task_id])
    task.toggle! :completed
    redirect_to :back
  end

  def destroy
    task = Task.find_by(:id => params[:task_id])
    task.destroy
    redirect_to "/tasks", notice: "Task has been deleted"
  end

end
