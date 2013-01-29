class ApplicationController < ActionController::Base
  protect_from_forgery
  
  rescue_from CanCan::AccessDenied do |exception|
      flash[:error] = exception.message
      if user_signed_in?
        redirect_to root_url
      else
        # Adds the protected page to the login url but only if the user is not logged in
        redirect_to :user_session
      end
    end

    def after_sign_in_path_for(resource_or_scope)
      # if a protected page found, then override the devise after login path
      params[:user]["next"] || super
    end

#  rescue_from CanCan::AccessDenied do |exception|
#    redirect_to :user_session, :alert => exception.message
#  end

end
