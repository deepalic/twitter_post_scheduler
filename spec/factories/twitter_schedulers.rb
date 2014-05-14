# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :twitter_scheduler do
    post_text 'MyText'
    schedule_at '2014-05-13 16:42:33'
    user_id '2'
  end
end
