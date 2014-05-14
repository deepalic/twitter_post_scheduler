require 'spec_helper'

describe 'index action' do
  before do
    visit '/'
  end

  it 'page should contain button sign in with twitter' do
    save_and_open_page
    expect(page).to have_link 'Sign In With Twitter'
  end
end
