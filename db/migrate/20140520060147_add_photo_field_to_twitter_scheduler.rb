class AddPhotoFieldToTwitterScheduler < ActiveRecord::Migration
  def change
    add_attachment :twitter_schedulers, :photo
  end
end
