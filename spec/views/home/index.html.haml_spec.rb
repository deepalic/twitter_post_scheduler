require 'spec_helper'

describe 'index action' do
  it 'page should contain button sign in with twitter' do
    visit '/'
    save_and_open_page
    expect(page).to have_link 'Sign In With Twitter'
  end
end
