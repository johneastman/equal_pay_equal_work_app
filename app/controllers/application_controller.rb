class ApplicationController < ActionController::Base
  private

  def sign_out
    session[:user_id] = nil
  end
  helper_method :sign_out

  def sign_in(user_id)
    session[:user_id] = user_id
  end
  helper_method :sign_in

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def current_user?(user)
    current_user == user
  end
  helper_method :current_user?

  def require_signin
    unless current_user
      session[:intended_url] = request.url
      redirect_to signin_path, alert: "Please sign in first!"
    end
  end
end
