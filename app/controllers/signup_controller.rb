class SignupController < ApplicationController


  def index
    #@users = User.where(activated: FILL_IN).paginate(page: params[:page])
    @users = User.all.paginate(page: params[:page])
  end

  def new

  	@user=User.new
  end



  def create
 
    @user = User.new(user_params)

     @user.save
      flash[:info] = "Please check your email to activate your account."
      redirect_to workspace_path
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
 

end