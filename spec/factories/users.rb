FactoryGirl.define do
  factory :user do
    u_id '9999'
    nickname 'test_user_name'
    name 'test user'
    profile_image 'http://abs.twimg.com/sticky/default_profile_images/test_profile_3_normal.png'
    url 'https://twitter.com/test_user_name'
    auth_token '9999-fANkac4xM040NlLQtWZcLvybbINvyu8GgICKdBX'
    auth_secret 'MFl6NIUakfOMiD8iiEibpeeVHMRaR2CbO8XjE7GiKCVOi'
    consumer_key 'APLSOAGWdBzZ62BGQGRXaiWIq'
    consumer_secret '2343APLSOAGWdBzZ62BGQGRXaiWIq'
  end
end
