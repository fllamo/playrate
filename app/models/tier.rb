class Tier < ActiveRecord::Base
  belongs_to :stat_search
  validates :importance, presence: true

  def multiplier
    case self.importance
    when 1
      1
    when 2
      0.7
    when 3
      0.4
    end
  end
end
