# Twitter scheduler controller
class TwitterSchedulersController < ApplicationController
  before_filter :set_twitter_scheduler, only: [:show, :edit, :update, :destroy]
  def index
    @twitter_schedulers = TwitterScheduler.all
  end

  def new
    @twitter_scheduler = TwitterScheduler.new
  end

  def create
    @twitter_scheduler = TwitterScheduler.new(twitter_scheduler_params)
    @twitter_scheduler.user_id = current_user.id
    if @twitter_scheduler.save
      redirect_to twitter_schedulers_path
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
      redirect_to twitter_schedulers_path
    end
  end

  def destroy
    if @twitter_scheduler.destroy
      redirect_to twitter_schedulers_path
    end
  end

  private

  def twitter_scheduler_params
    params.require(:twitter_scheduler).permit!
  end

  def set_twitter_scheduler
    @twitter_scheduler = TwitterScheduler.find(params[:id])
  end
end
