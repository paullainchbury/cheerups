class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
  redirect_to root_url , alert: "You can't access this page"
  end

  before_filter :define_users


  def after_sign_in_path_for(resource)
    new_cheerup_path
  end

  def define_users
    @users = User.by_rep
  end
end
