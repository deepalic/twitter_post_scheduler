# Twitter scheduler model class
class TwitterScheduler < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :post_text
  validates :post_text, length: { maximum: 140 }
  validates_presence_of :schedule_at

  has_attached_file :photo, styles: { medium: '300x300>', thumb: '100x100>' },
                            url: '/:attachment/:id/:style/:basename.:extension',
                            path: ':rails_root/public/:attachment/:id/:style/:basename.:extension',
                            use_timestamp: false

  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/

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
