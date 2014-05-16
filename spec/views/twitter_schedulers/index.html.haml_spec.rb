require 'spec_helper'
require 'fakeweb'

describe 'index action' do
  it 'page should contain add schedule link' do
    visit twitter_schedulers_path
    save_and_open_page
    expect(page).to have_link 'Add Schedule'
  end

  it 'page should have link for show, edit and delete' do
    visit twitter_schedulers_path
    page.first('a#show_link')
    page.first('a#edit_link')
    page.first('a#delete_link')
  end

  it 'should redirect to show page' do
    visit twitter_schedulers_path
    page.first('a#show_link').click
    current_path = twitter_scheduler_path(TwitterScheduler.last)
  end

  it 'should redirect_to edit page' do
    visit twitter_schedulers_path
    page.first('a#edit_link').click
    current_path = edit_twitter_scheduler_path(TwitterScheduler.last)
  end

  it 'should delete twitter scheduler record' do
    visit twitter_schedulers_path
    expect{
      page.first('a#delete_link').click
    }.to change(TwitterScheduler, :count).by(-1)
  end

  it 'should have Sign Out link' do
    #given
    visit '/'
    click_link 'Sign In With Twitter'
    expect do
      FakeWeb.register_uri(:get,
                           'http://127.0.0.1:3000/auth/twitter',
                           status: '200')
    end
    #then
    current_path = twitter_schedulers_path
    expect(page).to have_link 'Sign Out'
  end

  it 'should redirect_to home page' do
    #given
    visit '/'
    click_link 'Sign In With Twitter'
    expect do
      FakeWeb.register_uri(:get,
                           'http://127.0.0.1:3000/auth/twitter',
                           status: '200')
    end
    #then
    click_link 'Sign Out'
    current_path = root_path
  end
end

describe 'add schedule link' do
  it 'should redirect to new twitter scheduler page' do
    visit twitter_schedulers_path
    click_link 'Add Schedule'
    current_path == new_twitter_scheduler_path
  end
end
