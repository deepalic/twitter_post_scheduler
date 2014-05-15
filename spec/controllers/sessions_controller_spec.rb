require 'spec_helper'

describe SessionsController do
  describe 'create action' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.mock_auth[:twitter]
    end

    it 'should create user record' do
      expect{
        post :create, { "oauth_token"=>"qnIWAn6XPjEFF1B43tDIQfhPM2VToi9RDYHTTdr7sE", "oauth_verifier"=>"17I63L20a3eagjuK0fzT8DxIVhvVEtl9Cxns0YncIk", "provider"=>"twitter" }, "HTTPS" => "on"
      }.to change(User, :count).by(1)
    end

    it 'should create authentication' do
      lambda do
        post :create, provider: 'twitter'
        response.should redirect_to(twitter_schedulers_path)
      end
    end
  end
end
