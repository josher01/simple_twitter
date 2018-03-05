class Admin::TweetsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin
  def index
  end



  private
  def authenticate_admin
    if current_user.role == 'admin'
      redirect_to admin_tweets_path
    else
      redirect_back(fallback_location: root_path, alert: "You are Not admin !")
    end
  end
end
