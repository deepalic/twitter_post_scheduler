FactoryGirl.define do
  factory :user do
    u_id '9999'
    nickname 'test_user_name'
    name 'test user'
    profile_image 'http://abs.twimg.com/sticky/default_profile_images/test_profile_3_normal.png'
    url 'https://twitter.com/test_user_name'
    auth_token Yetting.auth_token
    auth_secret Yetting.auth_secret
    consumer_key 'APLSOAGWdBzZ62BGQGRXaiWIq'
    consumer_secret '2343APLSOAGWdBzZ62BGQGRXaiWIq'
  end
end
