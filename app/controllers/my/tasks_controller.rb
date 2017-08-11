class My::TasksController < ApplicationController
  before_action :find_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = if current_user.admin?
               Task.ordered_by_id
             else
               current_user.tasks
             end
  end

  def new
    @task = if current_user.admin?
              Task.new
            else
              current_user.tasks.new
            end
  end

  def create
    @task = if current_user.admin?
              Task.new task_params
            else
              current_user.tasks.new task_params
            end

    if @task.save
      redirect_to my_task_path(@task)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @task.attributes = task_params

    if @task.save
      redirect_to my_task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    if @task.destroy
      redirect_to my_tasks_path
    else
      raise 'O_o'
    end
  end

  private

  def task_params
    params.require(:task)
      .permit(:name, :description, :user_id)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end