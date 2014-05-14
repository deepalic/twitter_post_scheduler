# session controller
class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_hash = generate_user_hash(auth_hash)
    @user = User.find_or_create_from_user_hash(user_hash)
    session[:user_id] = @user.u_id
    redirect_to twitter_schedulers_path
  end

  def generate_user_hash(auth_hash)
    { u_id: "#{auth_hash.uid}",
      nickname: "#{auth_hash.info.nickname}",
      name: "#{auth_hash.info.name}",
      profile_image: "#{auth_hash.info.image}",
      url: "#{auth_hash.info.urls.Twitter}",
      auth_token: "#{auth_hash.extra.access_token.token}",
      auth_secret: "#{auth_hash.extra.access_token.secret}"
    }
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Signed out!'
  end
end
