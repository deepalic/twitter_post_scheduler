require 'spec_helper'

describe TwitterSchedulersController do
  describe 'index action' do
    it 'respond successfully with http 200 code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end
  end
end
