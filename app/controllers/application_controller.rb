	class ApplicationController < ActionController::Base
	rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
	 before_action :set_locale
	 helper_method :current_user
	  def current_user
	    if session[:user_id]
	      @current_user ||= User.find(session[:user_id])
	    else
	      @current_user = nil
	    end
	  end



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
	end
