require 'spec_helper'

describe HomeController do
  describe 'index action' do
    it 'respond successfully' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
