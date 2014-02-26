class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :define_users

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    redirect_to login_url, alert: "You must first log in." if current_user.nil?
  end

  def define_users
    @users = User.by_rep
    # @users = User.all
  end

end
