require 'spec_helper'
require 'rake'

describe 'rake task' do
  before do
    @rake = Rake::Application.new
    Rake.application = @rake
    Rake.application.rake_require '../../../lib/tasks/schedule_post'
    Rake::Task.define_task(:environment)
    @task_name = 'tweet_scheduling:schedule_post'
    @user = FactoryGirl.create(:user)
  end

  it 'should run rake task schedule_post' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    Timecop.travel(Time.now + 5.minutes)
    @rake[@task_name].invoke
    @twitter_scheduler = TwitterScheduler.last
    expect(@twitter_scheduler.status).should_not eq('scheduled')
  end
end
