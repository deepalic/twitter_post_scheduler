namespace :blog_application do
  desc 'TODO'
  task schedule_post: :environment do
    current_time = Time.now
    current_date = current_time.localtime
    current_date = current_date.strftime('%Y-%m-%d %H:%M')

    @twitter_posts = TwitterScheduler.where(schedule_at: current_date)
    if @twitter_posts.present?
      @twitter_posts.each do |twitter_post|
        user = twitter_post.user
        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = Yetting.consumer_key
          config.consumer_secret     = Yetting.consumer_secret
          config.access_token        = user.auth_token
          config.access_token_secret = user.auth_secret
        end
        client.update("#{twitter_post.post_text}")
      end
    end
  end
end
