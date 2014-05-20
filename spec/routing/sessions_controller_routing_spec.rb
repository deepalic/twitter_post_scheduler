require 'spec_helper'

describe SessionsController do
  describe 'routing' do
    it 'routes to #create' do
      expect(get('/auth/twitter/callback')).to route_to('sessions#create',
                                                        provider: 'twitter')
    end

    it 'routes to #destroy' do
      expect(delete('/signout')).to route_to('sessions#destroy')
    end
  end
end
