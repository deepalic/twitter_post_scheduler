require 'twitter'
require 'rake'
Rake::Task.clear
BlogApplication::Application.load_tasks
# Twitter scheduler controller
class TwitterSchedulersController < ApplicationController
  before_filter :authenticate_user
  before_filter :set_twitter_scheduler, only: [:show, :edit, :update, :destroy]
  def index
    @twitter_schedulers = current_user.twitter_schedulers
    @client = build_client(current_user)
    @tweets = @client.user_timeline("#{current_user.name}", count: 10)
  end

  def new
    @twitter_scheduler = TwitterScheduler.new
  end

  def create
    @twitter_scheduler = TwitterScheduler.new(twitter_scheduler_params)
    @twitter_scheduler.user_id = current_user.id
    if @twitter_scheduler.save
      redirect_to @twitter_scheduler
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @twitter_scheduler.update_attributes(twitter_scheduler_params)
      redirect_to @twitter_scheduler
    end
  end

  def destroy
    if @twitter_scheduler.destroy
      redirect_to twitter_schedulers_path
    end
  end

  def manage_scheduling
  end

  def start_scheduling
    Rake::Task['tweet_scheduling:schedule_post'].invoke
    redirect_to manage_scheduling_twitter_schedulers_path,
                flash: { success: 'Tweet Scheduling Started Successfully' }
  end

  private

  def twitter_scheduler_params
    params.require(:twitter_scheduler).permit!
  end

  def set_twitter_scheduler
    @twitter_scheduler = TwitterScheduler.find(params[:id])
  end

  def build_client(user)
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Yetting.consumer_key
      config.consumer_secret     = Yetting.consumer_secret
      config.access_token        = user.auth_token
      config.access_token_secret = user.auth_secret
    end
    client
  end
end
