class Submission < ActiveRecord::Base
  belongs_to :player_profile
  belongs_to :school

  validates :player_profile, presence: true
  validates :school, presence: true
end
