class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.order(created_at: :desc).first(5)
    @tweet = Tweet.new
  end


  def create
    @tweet = Tweet.new(tweet_params)
    if @tweet.save
      flash[:notice] = 'Tweet Created Successfully !'
      redirect_to tweets_path
    else
      flash[:alert] = @tweet.error.messages
      redirect_to tweets_path
    end
  end

  def show
    @tweet = Tweet.find(params[:tweet_id])
    
  end


  private
  def tweet_params
    params.require(:tweet).permit(:description)
  end
end
