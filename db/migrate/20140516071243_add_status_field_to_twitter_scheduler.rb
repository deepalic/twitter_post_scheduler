class AddStatusFieldToTwitterScheduler < ActiveRecord::Migration
  def change
    add_column :twitter_schedulers, :status, :string
  end
end
