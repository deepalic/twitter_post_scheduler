require 'spec_helper'

describe 'show action' do
  it 'displays the scheduler post text' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    visit twitter_scheduler_path(@twitter_scheduler)
    page.html.should include('MyText')
  end

  it 'should have link for edit and back' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    visit twitter_scheduler_path(@twitter_scheduler)
    expect(page).to have_link 'Back'
    expect(page).to have_link 'Edit'
  end
end
