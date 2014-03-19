class ApplicationController < ActionController::Base

   
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_locale  
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  


  private

  def user_not_authorized
    flash[:alert] = "Access denied."
    redirect_to (request.referrer || root_path)
  end 
  
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
    # current_user.locale
    # request.subdomain
    # request.env["HTTP_ACCEPT_LANGUAGE"]
    # request.remote_ip
  end

  def default_url_options(options = {})
    {locale: I18n.locale}
  end

end
