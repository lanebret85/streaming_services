class Show < ApplicationRecord
  belongs_to :streaming_service

  validates_presence_of :name
  validates_presence_of :genre
  validates :released, inclusion: [true, false]
  validates_presence_of :episodes
  validates_presence_of :seasons
  validates_presence_of :episode_runtime

  def self.display_true
    where(released: true)
  end

  def self.order_by_name
    order(:name)
  end

  def self.display_seasons_greater_than(number)
    where("seasons > #{number}")
  end
end