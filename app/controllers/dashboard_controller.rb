class DashboardController < ApplicationController
  def new
  end
def show
    
  end

def index
	@work= Workspace.all
end
def edit
   @workspace = Workspace.find(params[:id])
end
def update
    if @workspace.update_attributes(workspace_params)
      flash[:success] = "Profile updated"
      redirect_to @workspace
    else
      render 'edit'
    end
  end
    private

    def workspace_params
      params.require(:workspace).permit(:workspace_name,:about)
    end
end
