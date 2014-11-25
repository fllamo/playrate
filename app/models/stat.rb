class Stat < ActiveRecord::Base
  belongs_to :player_profile
  validates :value, presence: true
end
