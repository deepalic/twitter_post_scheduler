namespace :tweet_scheduling do
  desc 'TODO'
  task schedule_post: :environment do
    current_time = Time.now
    current_date = current_time.localtime
    current_date = current_date.strftime('%Y-%m-%d %H:%M')

    @twitter_posts = TwitterScheduler.where(schedule_at: current_date,
                                            status: 'scheduled')
    if @twitter_posts.present?
      @twitter_posts.each do |twitter_post|
        user = twitter_post.user
        begin
          client = Twitter::REST::Client.new do |config|
            config.consumer_key        = Yetting.consumer_key
            config.consumer_secret     = Yetting.consumer_secret
            config.access_token        = user.auth_token
            config.access_token_secret = user.auth_secret
          end
          if twitter_post.photo.present?
            url = "#{Rails.root}/public#{twitter_post.photo.url}"
            client.update_with_media("#{twitter_post.post_text}",
                                     File.new(url))
          else
            client.update("#{twitter_post.post_text}")
          end
          twitter_post.success!
        rescue
          twitter_post.failed!
        end
      end
    end
  end
end
