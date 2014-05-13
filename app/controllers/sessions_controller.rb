# session controller
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_hash = generate_user_hash(auth_hash)
    # @user = User.find_or_create_from_auth_hash(auth_hash)
    # self.current_user = @user
    redirect_to root_path
  end

  def generate_user_hash(auth_hash)
    { u_id: "#{auth_hash.uid}",
      nickname: "#{auth_hash.info.nickname}",
      name: "#{auth_hash.info.name}",
      profile_image: "#{auth_hash.info.image}",
      url: "#{auth_hash.info.urls.Twitter}",
      auth_token: "#{auth_hash.extra.access_token.token}",
      auth_secret: "#{auth_hash.extra.access_token.secret}",
      consumer_key: "#{auth_hash.extra.access_token.consumer.key}",
      consumer_secret: "#{auth_hash.extra.access_token.consumer.secret}"
    }
  end
end
