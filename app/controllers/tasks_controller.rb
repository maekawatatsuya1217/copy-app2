class TasksController < ApplicationController

  before_action :authenticate_user!, only: [:index]
  before_action :tasks_definition, only: [:index]

  def index
    @status = ['todo', 'advice', 'memo']  
  end

  def show
  end

  def store
  end

  def update
  end

  def destroy
  end

  private

  def tasks_definition
    @tasks = Task.where(user_id: current_user.id).includes(:user).order('created_at DESC')
  end
end
