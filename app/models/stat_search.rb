class StatSearch < ActiveRecord::Base
  belongs_to :position_search
  has_many :tiers, dependent: :destroy
  accepts_nested_attributes_for :tiers

  validates :name, presence: true
  validates :coefficient, presence: true

  def has_values?
    self.tiers.map(&:start_value).compact.any?
  end

  def calculate_score(stat_number)
    score = 0
    tier1, tier2, tier3 = self.tiers.order(:importance).to_a
    if stat_number != 0
      if stat_number >= (tier1.start_value || 9999)
        score = self.coefficient * tier1.multiplier
      elsif stat_number.between?(tier2.start_value || 0, tier1.start_value || 0)
        score = self.coefficient * tier2.multiplier
      elsif stat_number.between?(tier3.start_value || 0, tier2.start_value || 0)
        score = self.coefficient * tier3.multiplier
      end
    end
    score
  end

end
