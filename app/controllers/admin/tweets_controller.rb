class Admin::TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  def index
    @tweets = Tweet.all.page(params[:page]).per(15)
    render :index
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_tweets_path
  end

  

  private
  def authenticate_admin
    unless current_user.role == 'admin'
      redirect_back(fallback_location: root_path, alert: "You are Not admin !")
    end
  end

end
