class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :logged_in?, :current_user

  def current_user
    session_id = session[:user_id]
    User.find(session_id) if session_id
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:warning] = ['you must be logged in to access this page']
      redirect_to root_path
    end
    # redirect_to root_path if !logged_in?
  end
end
