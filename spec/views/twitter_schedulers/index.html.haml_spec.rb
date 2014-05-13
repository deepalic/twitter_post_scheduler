require 'spec_helper'

describe 'index action' do
  it 'page should contain add schedule link' do
    visit twitter_schedulers_path
    save_and_open_page
    expect(page).to have_link 'add schedule'
  end
end
