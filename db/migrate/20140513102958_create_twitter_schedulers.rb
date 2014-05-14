class CreateTwitterSchedulers < ActiveRecord::Migration
  def change
    create_table :twitter_schedulers do |t|
      t.text :post_text
      t.datetime :schedule_at
      t.references :user

      t.timestamps
    end
  end
end
