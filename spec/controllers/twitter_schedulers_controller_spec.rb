require 'spec_helper'

describe TwitterSchedulersController do
  describe 'index action' do
    it 'respond successfully with http 200 code' do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it 'should display twitter schedulers list' do
      @twitter_schedulers = FactoryGirl.create(:twitter_scheduler)
      get :index
      expect(assigns(:twitter_schedulers)).to match_array([@twitter_schedulers])
      response.should render_template(:index)
    end

  end

  describe 'new action' do
    it 'should render new template' do
      get :new
      assigns(:twitter_scheduler).should be_a_new(TwitterScheduler)
      expect(response).to render_template(:new)
    end
  end

  describe 'create action' do
    it 'should redirect to index template' do
      post :create, { twitter_scheduler: { 'post_text' => 'dummypost',
                                           'schedule_at' => '2014-05-13 16:42:33',
                                           'user_id' => '2' } }
      expect(response).to redirect_to(twitter_schedulers_path)
    end

    it 'should create new twitter scheduler' do
      expect do
        post :create, { twitter_scheduler: FactoryGirl.attributes_for(:twitter_scheduler) }
      end.to change(TwitterScheduler, :count).by(1)
    end
  end
end
