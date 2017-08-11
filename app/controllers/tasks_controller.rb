class TasksController < ApplicationController
  def index
    @tasks = Task.ordered_by_id
  end

  def new; end

  def edit; end
end
