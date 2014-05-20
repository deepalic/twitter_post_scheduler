require 'spec_helper'
describe TwitterSchedulersController do
  describe 'routing' do
    it 'routes to #index' do
      expect(get('/twitter_schedulers')).to route_to('twitter_schedulers#index')
    end

    it 'routes to #show' do
      expect(get('/twitter_schedulers/1')).to route_to('twitter_schedulers#show',
                                                       id: '1')
    end

    it 'routes to #new' do
      expect(get('/twitter_schedulers/new')).to route_to('twitter_schedulers#new')
    end

    it 'routes to #create' do
      expect(post('/twitter_schedulers')).to route_to('twitter_schedulers#create')
    end

    it 'routes to #edit' do
      expect(get('/twitter_schedulers/1/edit')).to route_to('twitter_schedulers#edit',
                                                            id: '1')
    end

    it 'routes to #update' do
      expect(put('/twitter_schedulers/1')).to route_to('twitter_schedulers#update',
                                                       id: '1')
    end

    it 'routes to #destroy' do
      expect(delete('/twitter_schedulers/1')).to route_to('twitter_schedulers#destroy',
                                                          id: '1')
    end
  end
end
