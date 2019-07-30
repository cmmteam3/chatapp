class SignupController < ApplicationController
  def index
      @user=User.new
  end
     def new
     	@user=User.new
      end
      def create
     @user=User.new(users_params)
      if @user.save
      redirect_to :controller => 'session', :action => 'new' 
     flash[:notice] = t(:"User SignUp Successful")
     else
      flash[:alert] = t(:"Signup Not Successfull")
     render 'signup/index'
      end
    end
      private 
      def users_params
      	params.require(:user).permit(:name,:email,:password,:password_confirmation)
      end
end
