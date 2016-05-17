class TweetsController < ApplicationController

  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  def index
    @tweets = Tweet.all
  end

  def show
  end

  def edit
  end

  def new
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to tweet_path(@tweet.id), notice: "Tweet was successfully created"}
      else
        format.html { render :new }
      end
    end
  end

  private
  # Using a private method to encapsulate the permissible parameters is
  # just a good pattern since you'll be able to reuse the same permit
  # list between create and update. Also, you can specialize this method
  # with per-user checking of permissible attributes.
  def tweet_params
    params.require(:tweet).permit(:message, :user_id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
