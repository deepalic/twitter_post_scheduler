require 'spec_helper'

describe TwitterSchedulersController do
  # Spec for index action
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

  # Spec for new action
  describe 'new action' do
    it 'should render new template' do
      get :new
      assigns(:twitter_scheduler).should be_a_new(TwitterScheduler)
      expect(response).to render_template(:new)
    end
  end

  # Spec for create action
  describe 'create action' do
    it 'should redirect to index template' do
      post :create, twitter_scheduler: { 'post_text' => 'dummypost',
                                           'schedule_at' => '2014-05-13 16:42:33',
                                           'user_id' => '2' }
      expect(response).to redirect_to(twitter_schedulers_path)
    end

    it 'should create new twitter scheduler' do
      expect do
        post :create, twitter_scheduler: FactoryGirl.attributes_for(:twitter_scheduler)
      end.to change(TwitterScheduler, :count).by(1)
    end
  end

  # Spec for show action
  describe 'show action' do
    it 'should render show template' do
      @twitter_schedulers = FactoryGirl.create(:twitter_scheduler)
      get :show, id: @twitter_schedulers.id
      expect(response).to render_template(:show)
    end
  end

  # Spec for edit action
  describe 'edit action' do
    it 'should render edit template' do
      @twitter_schedulers = FactoryGirl.create(:twitter_scheduler)
      get :edit, id: @twitter_schedulers.id
      expect(response).to render_template(:edit)
    end

    it 'assigns the requested twitter scheduler as @twitter_scheduler' do
      twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
      get :edit, id: twitter_scheduler.to_param
      assigns(:twitter_scheduler).should eq(twitter_scheduler)
    end
  end

  # Spec for update action
  describe 'update action' do
    it 'should update twitter scheduler' do
      @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
      put :update, id: @twitter_scheduler, twitter_scheduler: FactoryGirl.attributes_for(:twitter_scheduler)
    end

    it 'should redirect to index page after updation' do
      @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
      put :update, id: @twitter_scheduler, twitter_scheduler: FactoryGirl.attributes_for(:twitter_scheduler)
      expect(response).to redirect_to(twitter_schedulers_path)
    end
  end
end
