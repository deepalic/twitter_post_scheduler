# User class
class User < ActiveRecord::Base
  has_many :twitter_schedulers, dependent: :destroy

  validates_presence_of :u_id, :nickname, :name, :profile_image, :url,
                        :auth_token, :auth_secret

  def self.find_or_create_from_user_hash(user_hash)
    if User.find_by_u_id(user_hash[:u_id]).present?
      user = User.find_by_u_id(user_hash[:u_id])
    else
      user = User.new(user_hash)
      user.save
    end
    user
  end
end
