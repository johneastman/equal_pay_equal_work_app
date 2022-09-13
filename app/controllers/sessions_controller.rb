class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.where(email: params[:email]).first
    if user && user.authenticate(params[:password])
      sign_in(user.id)
      redirect_to employers_path
    else
      # If the email doesn't match an existing user, redisplay the login page because login failed
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    sign_out
    redirect_to employers_path, status: :see_other
  end
end
