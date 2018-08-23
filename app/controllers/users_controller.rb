class UsersController < ApplicationController
  def new
  end
  def show
    @user = User.find(params[:id])
    #debugger
  end
  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
