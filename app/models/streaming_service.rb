class StreamingService < ApplicationRecord
  has_many :shows, dependent: :destroy

  validates_presence_of :name
  validates :subscribed, inclusion: [true, false]
  validates :logged_in, inclusion: [true, false]
  validates_presence_of :rating

  def self.order_by_time_created
    order(created_at: :desc)
  end
end