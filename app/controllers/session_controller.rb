  class SessionController < ApplicationController

    def new
    end

    def create
      if params[:session][:email].blank? && params[:session][:password].present?
         redirect t(:'Email address missing')
      elsif params[:session][:email].present? && params[:session][:password].blank?
            redirect t(:'Password missing')
      elsif params[:session][:email].blank? && params[:session][:password].blank?
            redirect t(:'Email address and password missing')
      else
         user = User.find_by(email: params[:session][:email])
        if user.present?
           if user && user.authenticate(params[:session][:password])
              log_in user
              redirect_to :controller => 'workspaces', :action => 'index' 
           else
              redirect t(:'Incorrect email/password combo')
           end   
        else
            redirect t(:'Unknown user')
      end
    end

end

def destroy
 session[:user_id]= nil
 redirect_to :controller => 'session', :action => 'new' 
end

def redirect(alert)
  redirect_to login_path(params[:redirect_url].present? ? {:redirect_url => params[:redirect_url]} : {}), :alert => alert
end
end
