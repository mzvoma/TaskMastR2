TaskMastR2::Application.routes.draw do

  root 'tasks#index'

  #SESSIONS
  get "/login" => 'sessions#new'
  get "/logout" => 'sessions#destroy'
  get "/authenticate" => 'sessions#create'

  #USERS
  # Create
  get "/users/new" => 'users#new'
  get "/users/create" => 'users#create'
   get "/users/:user_id/show" => 'users#show'

  # PROJECTS
  # Create
  get "/projects/new" => "projects#new"
  get "/projects/create" => "projects#create"

  # Delete
  get "/projects/:project_id/delete" => "projects#destroy"

  # TASKS
  # Create
  get "/tasks/new" => "tasks#new"
  get "/tasks/create" => "tasks#create"

  # Read
  get "/tasks" => "tasks#index"
  get "/tasks/:task_id/show" => "tasks#show"

  # Update
  get "/tasks/:task_id/edit" => "tasks#edit"
  get "/tasks/:task_id/update" => "tasks#update"

  # Delete
  get "/tasks/:task_id/delete" => "tasks#destroy"

  #MEMBERSHIPS
  get "/memberships/new" => "memberships#new"
  get "/memberships/create" => "memberships#create"

  # Delete (add in version 3)
  # get "/memberships/:membership_id/delete" => "memberships#destroy"


  #WEATHER
  get "/weather/search" => "weather#search"
  get "/weather/conditions" => "weather#conditions"

end
