# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :twitter_scheduler do
    post_text 'MyText'
    schedule_at '2014/05/21 14:35'
    user_id '2'
    status 'scheduled'
  end
end
