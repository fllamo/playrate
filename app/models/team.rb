class Team < ActiveRecord::Base
  belongs_to :player_profile
  has_one :testimonial
  validates :name, presence: true
  validates :jersey_number, presence: true
  validates :duration, presence: true
  validates :coach, presence: true
  validates :coach_email, presence: true
end
