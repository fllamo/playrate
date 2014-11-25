class NoteBook < ActiveRecord::Base
  belongs_to :player_profile
  belongs_to :recruiter_profile

  def self.lead_statuses
    ['Active', 'Dormant', 'High Level of Interest',
     'Verbally Committed', 'No Interest']
  end
end
