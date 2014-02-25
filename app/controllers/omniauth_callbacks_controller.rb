class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    #load_and_authorize_resource

      def facebook
        user = User.find_for_facebook_oauth(request.env["omniauth.auth"])
        if user.persisted?
          flash.notice = "Signed in Through Facebook!"
          sign_in_and_redirect user
        else
          session["devise.user_attributes"] = user.attributes
          flash.notice = "Problem creating account"
          redirect_to new_user_registration_url
        end
      end
    end
