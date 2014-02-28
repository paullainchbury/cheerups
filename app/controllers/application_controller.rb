class ApplicationController < ActionController::Base
  protect_from_forgery


  rescue_from CanCan::AccessDenied do |exception|
  redirect_to new_user_registration_path , alert: "You must be a registered user."
  end

  before_filter :define_users, :get_activity


  def after_sign_in_path_for(resource)
    new_cheerup_path
  end

  def define_users
    @users = User.by_rep
  end

  def get_activity
    @activities = Activity.order("created_at desc")
  end

  def track_activity(trackable, action = params[:action])
    current_user.activities.create! action: action, trackable: trackable
  end

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end
end
