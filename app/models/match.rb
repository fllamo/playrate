class Match < ActiveRecord::Base
  belongs_to :position_search
  belongs_to :player_profile

  scope :unseen, -> { where(seen: false) }

  def search_score=(val)
    write_attribute(:search_score, val)
    # init total score
    self.total_score = self.search_score
  end
end
