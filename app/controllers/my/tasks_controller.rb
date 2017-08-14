class My::TasksController < ApplicationController
  before_action :find_task,
    only: %i[show edit update destroy download to_new to_started to_finished]

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

  def show; end

  def edit; end

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

  def download
    send_file @task.file.path,
              disposition: :attachment
  end

  %i[to_new to_started to_finished].each do |action|
    define_method action do
      @task.send(%(#{action}!))

      redirect_to :back
    end
  end

  private

  def task_params
    params.require(:task)
          .permit(:name, :description, :user_id, :file)
  end

  def find_task
    @task = Task.find(params[:id])
  end
end
