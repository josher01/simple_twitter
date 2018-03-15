class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update]

  def edit
  end

  def update
    if @user.update(user_profile_params)
      flash[:notice] = "User Profile Udpate Successfully !"
    else
      flash[:alert] = @user.error.full_messsages
    end
    redirect_to edit_user_path
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_profile_params
    params.require(:user).permit(:introduction, :name, :avatar)
  end

end
