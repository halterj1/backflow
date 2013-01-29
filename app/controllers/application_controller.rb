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
  
  if Rails.env.production?
    unless Rails.application.config.consider_all_requests_local
      rescue_from Exception, with: :render_500
      rescue_from ActionController::RoutingError, with: :render_404
      rescue_from ActionController::UnknownController, with: :render_404
      rescue_from ActionController::UnknownAction, with: :render_404
      rescue_from ActiveRecord::RecordNotFound, with: :render_404
    end
  end
  
  def render_404(exception)
    @not_found_path = exception.message
    respond_to do |format|
      format.html { render template: 'errors/not_found', layout: 'layouts/application', status: 404 }
      format.all { render nothing: true, status: 404 }
    end
  end
 
  def render_500(exception)
    logger.info exception.backtrace.join("\n")
    respond_to do |format|
      format.html { render template: 'errors/internal_server_error', layout: 'layouts/application', status: 500 }
      format.all { render nothing: true, status: 500}
    end
  end

end
