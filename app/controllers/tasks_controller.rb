class TasksController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :tasks_definition, only: [:index, :show]
  before_action :task_build, only: [:show]

  def index
    @status = ['todo', 'state', 'limit_date']  
  end

  def show
    id      = params[:id]
    @task   = Task.find(id)
    @status = ['todo', 'doing', 'done']
  end

  def store
    task = Task.new
    task.task       = params[:task]
    task.state      = params[:state]
    task.limit_date = params[:limit_date]
    task.save
    redirect_to '/tasks', notice: 'タスクを作成しました。'
  end

  def update
  end

  def destroy
  end

  private

  def tasks_definition
    @tasks = Task.where(user_id: current_user.id).includes(:user).order('created_at DESC')
  end

  def task_build
    @task = Task.find(params[:id])
  end
end
