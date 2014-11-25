class PositionSearch < ActiveRecord::Base
  belongs_to :recruiter_profile
  belongs_to :sport
  belongs_to :position
  has_many :stat_searches, dependent: :destroy
  accepts_nested_attributes_for :stat_searches
  has_many :matches, dependent: :destroy

  validates :name, presence: true
  validates :sport, presence: true
  validates :position, presence: true
  validate :has_some_search_criteria
  validate :has_assigned_all_points

  def name
    read_attribute(:name) || "#{self.sport && self.sport.name} #{self.position && self.position.name}"
  end

  def points_remaining
    # Note, we want to use Array.sum and not ActiveRecord.sum, hence the map
    100 - self.stat_searches.map(&:coefficient).sum
  end

  # figure out and create match with search_score
  def match_against!(player_profile)
    if self.position == player_profile.position
      score = 0 # everyone has got to start somewhere
      self.stat_searches.each do |stat_search|
        score += stat_search.calculate_score(player_profile.stat(stat_search.name))
      end

      Match.create(position_search: self, player_profile: player_profile, search_score: score) unless score == 0
    end
  end

  private

  def has_some_search_criteria
    self.errors.add(:base, "A search must have at least some search criteria") unless self.stat_searches.any?{|s| s.has_values?}
  end

  def has_assigned_all_points
    self.errors.add(:base, "You must assign all 100 points") unless self.points_remaining == 0
  end
end
