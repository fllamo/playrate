class School < ActiveRecord::Base
  has_many :recruiter_profiles
  has_many :position_searches, through: :recruiter_profiles
  has_many :submissions
  has_and_belongs_to_many :sports

  validates :name, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :avg_sat_reading_starts_at, presence: true
  validates :avg_sat_reading_ends_at, presence: true
  validates :avg_sat_math_starts_at, presence: true
  validates :avg_sat_math_ends_at, presence: true
  validates :avg_sat_writing_starts_at, presence: true
  validates :avg_sat_writing_ends_at, presence: true
  validates :avg_act_composite_starts_at, presence: true
  validates :avg_act_composite_ends_at, presence: true
  validates :avg_gpa, presence: true
  validates :enrollement_size, presence: true

  def submitted_to_by(player_profile)
    Submission.exists?(player_profile: player_profile, school: self)
  end

  def image_slug
    self.name.parameterize
  end

  def image_url
    "schools/#{self.image_slug}.gif"
  end

  def location
    "#{self.city}, #{self.state}"
  end

  def self.divisions
    ['America East Conference', 'Atlantic Coast Conference', 'Big East Conference',
     'Big Ten Conference', 'Colonial Athletic Conference', 'Ivy League', 'Metro Athletic Conference',
     'Northeast Conference', 'Patriot League', 'Southern Conference', 'Conference Carolinas',
     'East Coast Athletic Conferences', 'East Coast Conference', 'Northeast 10',
     'South Atlantic Conference', 'Sunshine State Conference', 'Western Intercollegiate Lacrosse Association',
     'Empire 8', 'Capital Athletic Conference', 'Centennial Conference', 'Colonial States Athletic Conference',
     'Commonweatlh Conference', 'Great Northeast Athletic Conference', 'Landmark Conference', 'Liberty League',
     'Little East', 'MAC Commonweatlh', 'MAC Freedom', 'Michigan Intercollegiate', 'Midwest Conference',
     'NESCAC', 'NEWMAC', 'North Atlantic Conference', 'North Coast Athletic Conference',
     'North Eastern Athletic Conference', 'Ohio Athletic Conference', 'Old Dominion Athletic Conference',
     'Skyline Conference', 'Southern Athletic Association', 'Southern College Athletic Conference', 'SUNYAC',
     'Independent']
  end

  def self.conferences
    ['Conferences 1', 'Conference 2', 'Conference 3']
  end

  def self.SAT_scores
    (200..800).step(10).to_a.reverse
  end

  def self.GPA_scores
    (1..4).step(0.1).to_a.map{|f| f.round(1)}.reverse
  end

  def self.csv_to_db(csv_data)
    csv_file = csv_data.read
    CSV.parse(csv_file, {headers: true}) do |row|
      school = School.where(id: row['Id']).first_or_initialize
      School.column_names.each do |key|
        unless key == "id" || key == "created_at" || key == 'updated_at'
          value = row[key.humanize]
          school.send "#{key}=", value
        end
      end
      if school.save
        # We could optimize this by caching the sport_name's id in a hash
        if row['Sports']
          row['Sports'].split(',').each do |sport_name|
            sport = Sport.find_by_name(sport_name.strip)
            if sport
              school.sports << sport
            end
          end
        end
      end
    end
  end
end
