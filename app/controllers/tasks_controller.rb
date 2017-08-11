class TasksController < ApplicationController
  load_and_authorize_resource through: :current_user

  def index; end

  def new; end

  def edit; end
end
