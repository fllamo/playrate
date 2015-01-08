class Sport < ActiveRecord::Base
  has_many :positions
  has_and_belongs_to_many :schools
  validates :name, presence: true, uniqueness: true
end
