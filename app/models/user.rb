class User < ActiveRecord::Base
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
