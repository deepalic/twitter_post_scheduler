# Twitter scheduler model class
class TwitterScheduler < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :post_text
  validates_presence_of :schedule_at

  state_machine :status, initial: :scheduled do
    event :success do
      transition [:scheduled] => :success
    end
    event :failed do
      transition [:scheduled] => :failed
    end

    state :scheduled, :success, :failed
  end
end
