require 'spec_helper'

describe 'index action' do
  it 'page should contain add schedule link' do
    visit twitter_schedulers_path
    save_and_open_page
    expect(page).to have_link 'add schedule'
  end
end

describe 'add schedule link' do
  it 'should redirect to new twitter scheduler page' do
    visit twitter_schedulers_path
    click_link 'add schedule'
    current_path == new_twitter_scheduler_path
  end
end
