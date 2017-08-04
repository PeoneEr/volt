class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: session_params[:email])

    if user && user.encrypted_password == EncrypeService.new(session_params[:password]).call
      sign_in(user)

      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end

  private

  def session_params
    params[:session]
  end
end
