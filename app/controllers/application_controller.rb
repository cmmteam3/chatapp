	class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	 before_action :set_locale
	 protect_from_forgery with: :exception
     include SessionHelper



  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    { locale: I18n.locale }
  end

   private
 
  def record_not_found
    render text: "404 Not Found", status: 404
  end


  def root
    # Homepage
  end

  protected

  def require_login
    redirect_to login_path and return unless logged_in?
  end

	end
