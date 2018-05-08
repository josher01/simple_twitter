class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :followings, :followers, :tweets, :likes]

  def edit
  end

  def update
    if @user.update(user_profile_params)
      flash[:notice] = "User Profile Udpate Successfully !"
    else
      flash[:alert] = @user.error.full_messsages
    end
    redirect_to tweets_user_path(@user)
  end

  def follow
    @followship = Followship.new(user_id: current_user.id, following_id: params[:id])
    if @followship.save!
      flash[:notice] = "Follow Successfully !"
    else
      flash[:alert] = "Sry, something went wrong..."
    end
    redirect_back(fallback_location: root_path)
  end

  def unfollow 
    @followship = Followship.find_by(user_id: current_user.id, following_id: params[:id])
    @followship.destroy
    flash[:notice] = "Followship destroyed !"
    redirect_back(fallback_location: root_path)
  end

  def followings
    @followings = @user.followings.order(created_at: :desc)
    render "followings"
  end

  def followers
    @followers = @user.followers.order(created_at: :desc)
    render "followers"
  end

  def tweets
    @tweets = @user.tweets.order(created_at: :desc)
    render "tweets"
  end

  def likes
    @liked_tweets = @user.liked_tweets.order(created_at: :desc)
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_profile_params
    params.require(:user).permit(:introduction, :name, :avatar)
  end

  

end
