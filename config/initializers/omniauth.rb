Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Yetting.consumer_key, Yetting.consumer_secret
end
