require 'spec_helper'

describe TwitterScheduler do
  it 'should require post_text and schedule_at' do
    @twitter_scheduler = { post_text: '', schedule_at: '' }
    TwitterScheduler.new(@twitter_scheduler).should_not be_valid
  end
end
