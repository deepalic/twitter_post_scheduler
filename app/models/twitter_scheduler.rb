# Twitter scheduler model class
class TwitterScheduler < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :post_text
  validates_presence_of :schedule_at
end
