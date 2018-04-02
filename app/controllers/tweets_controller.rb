class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.order(created_at: :desc).first(5)
    @tweet = Tweet.new
  end


  def create
    @tweet = current_user.tweets.build(tweet_params)
    if @tweet.save
      flash[:notice] = 'Tweet Created Successfully !'
      redirect_to tweets_path
    else
      flash[:alert] = @tweet.errors.messages
      redirect_to tweets_path
    end
  end

  def like
    @tweet = Tweet.find(params[:id])
    @like = Like.create(tweet_id: @tweet.id, user_id: current_user.id)
    redirect_back(fallback_location: root_path)
  end

  def unlike
    @tweet = Tweet.find(params[:id])
    @like = Like.where(tweet_id: @tweet.id, user_id: current_user.id).destroy_all
    redirect_back(fallback_location: root_path)
  end

  def show
    @tweet = Tweet.find(params[:id])

  end


  private
  def tweet_params
    params.require(:tweet).permit(:description, :user_id)
  end
end
