class SignupController < ApplicationController
  def index
  end
     def new
     	@user=User.new
      end
      def create
      @user=User.new(users_params)
      @user.save
     redirect_to root_url
      end
      private 
      def users_params
      	params.require(:user).permit(:name,:email,:password)
      end
end
