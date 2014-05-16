require 'spec_helper'

describe 'edit action' do
  it 'Should open edit page fill the form fields' do
    # given
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    visit twitter_scheduler_path(@twitter_scheduler)

    # when
    find_link('Edit').click

    # then
    page.current_path.should eq("/twitter_schedulers/#{@twitter_scheduler.id}/edit")
    page.html.should include('Edit Twitter Scheduler')
    find_field('twitter_scheduler[post_text]').value.should eq(@twitter_scheduler.post_text.to_s)
    find_field('twitter_scheduler[schedule_at]').value.should eq(@twitter_scheduler.schedule_at.to_s)
    find_button('Save')

    # when
    fill_in 'twitter_scheduler[post_text]', with: 'Dummy Text post'
    click_button 'Save'

    # then
    page.html.should include('Dummy Text post')
  end

  it 'page should have back link' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    visit edit_twitter_scheduler_path(@twitter_scheduler)
    expect(page).to have_link 'Back'
  end

  it 'click on back link page should redirect to index page' do
    @twitter_scheduler = FactoryGirl.create(:twitter_scheduler)
    visit edit_twitter_scheduler_path(@twitter_scheduler)
    expect(page).to have_link 'Back'
    click_link 'Back'
    current_path == twitter_schedulers_path
  end
end
