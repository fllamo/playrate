class Testimonial < ActiveRecord::Base
  belongs_to :team
  validates :team, presence: true

  def complete?
    self.body.present?
  end
end
