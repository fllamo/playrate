class RecruiterProfile < ActiveRecord::Base
  belongs_to :sport
  belongs_to :user
  belongs_to :school
  has_many :conversations
  has_many :player_profiles, through: :conversations
  has_many :position_searches

  validates :sport, presence: true
  validates :school, presence: true
end
