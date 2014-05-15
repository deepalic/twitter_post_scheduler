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
end
