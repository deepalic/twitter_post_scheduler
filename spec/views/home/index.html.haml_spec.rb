require 'spec_helper'
require 'fakeweb'

describe 'index action' do
  before do
    visit '/'
  end

  it 'page should contain button sign in with twitter' do
    save_and_open_page
    expect(page).to have_link 'Sign In With Twitter'
  end
end

describe 'click Sign In With Twitter link' do
  it 'visit twitter auth page response with code 200' do
    visit '/'
    click_link 'Sign In With Twitter'
    expect do
      FakeWeb.register_uri(:get,
                           'http://127.0.0.1:3000/auth/twitter',
                           status: '200')
    end
  end
end
