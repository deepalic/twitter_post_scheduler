require 'spec_helper'

describe TwitterScheduler do
  it 'should require post_text and schedule_at' do
    @twitter_scheduler = { post_text: '', schedule_at: '' }
    TwitterScheduler.new(@twitter_scheduler).should_not be_valid
  end

  it 'should be valid' do
    @twitter_scheduler = { post_text: 'MyText', schedule_at: '2014-05-13 16:42:33' }
    TwitterScheduler.new(@twitter_scheduler).should be_valid
  end

  it 'should be 140 characters' do
    twitter_scheduler  = TwitterScheduler.new(post_text: 'a',
                                              schedule_at: '2014-05-13 16:42:33')
    twitter_scheduler.post_text = 'a' * 140
    twitter_scheduler.should be_valid
  end
end
