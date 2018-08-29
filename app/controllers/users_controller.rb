class UsersController < ApplicationController
  def new
    @user = User.new
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
