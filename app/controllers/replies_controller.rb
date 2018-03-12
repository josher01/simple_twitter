class RepliesController < ApplicationController
  before_action :find_tweet, only: [:index, :create]

  def index
    @replies = @tweet.replies.all
    @reply = Reply.new
  end

  def create
    @reply = @tweet.replies.build(reply_params)
    @reply.user = current_user
    if @reply.save
      flash[:notice] = 'Reply created !'
    else 
      flash[:alert] = @reply.errors.messages
    end
    redirect_to tweet_replies_path
  end

  private
  def reply_params
    params.require(:reply).permit(:comment, :user_id, :tweet_id)
  end

  def find_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end
end

