class Position < ActiveRecord::Base
  belongs_to :sport
  validates :name, presence: true
end
