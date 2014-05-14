require 'spec_helper'

describe 'show action' do
  it 'displays the scheduler post text' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    puts @twitter_scheduler.to_json
    visit twitter_scheduler_path(@twitter_scheduler)
    expect(page).to have_content 'MyText'
  end
end
