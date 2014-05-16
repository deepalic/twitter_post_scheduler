require 'spec_helper'

describe 'new action' do
  it 'page should contain add schedule link' do
    visit twitter_schedulers_path
    save_and_open_page
    expect(page).to have_link 'Add Schedule'
  end

  it 'page should have back link' do
    visit new_twitter_scheduler_path
    expect(page).to have_link 'Back'
  end

  it 'click on back link page should redirect to index page' do
    visit new_twitter_scheduler_path
    expect(page).to have_link 'Back'
    click_link 'Back'
    current_path == twitter_schedulers_path
  end

end
