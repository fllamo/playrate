class PlayerProfile < ActiveRecord::Base
  obfuscate_id spin: 31337

  belongs_to :user
  belongs_to :sport
  belongs_to :position
  has_many :teams, dependent: :destroy
  has_many :testimonials, through: :teams
  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :awards, reject_if: :all_blank, allow_destroy: true
  has_many :games, dependent: :destroy
  accepts_nested_attributes_for :games, reject_if: :all_blank, allow_destroy: true
  has_many :highlights
  has_many :stats, dependent: :destroy
  accepts_nested_attributes_for :stats
  has_many :matches, dependent: :destroy
  has_many :note_books
  has_many :conversations
  has_many :submissions
  has_many :schools, through: :submissions

  def stat(name)
    stat = Stat.where(player_profile: self, name: name).first
    stat.value if stat
  end

  def complete?
    !completion_step
  end

  def completion_step
    if highlights_complete?
      false
    elsif teams_complete?
      'highlights'
    elsif stats_complete?
      'teams'
    elsif academics_complete?
      'stats'
    elsif account_complete?
      'academics'
    else
      'account'
    end
  end

  def account_complete?
    [self.phone, self.dob, self.parent_phone,
    self.parent_email, self.street_address, self.city,
    self.state, self.zip, self.school].reduce{|r, e| r && e.present?}
  end

  def academics_complete?
    self.graduation_year && self.stats.find_by_name('GPA')
  end

  def stats_complete?
    # TODO: This is super inefficient, need to either cache this or figure out a better way to check for completeness.
    self.sport && self.position &&
    self.position.stats.map{|ps| self.stats.exists?(name: ps)}.reduce{|r, e| r && e.present?}
  end

  def teams_complete?
    self.teams.any?
  end

  def highlights_complete?
    self.highlights.any?
  end

  def self.academic_stats_fields
    ['GPA', 'SAT Reading Score', 'SAT Math Score',
     'SAT Writing Score', 'Composite ACT Score']
  end

  def self.global_stats_fields
    ['Height', 'Weight']
  end

end
