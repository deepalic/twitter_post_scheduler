class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :u_id
      t.string :nickname
      t.string :name
      t.string :profile_image
      t.string :url
      t.string :auth_token
      t.string :auth_secret
      t.string :consumer_key
      t.string :consumer_secret

      t.timestamps
    end
  end
end
