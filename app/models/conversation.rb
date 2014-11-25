class Conversation < ActiveRecord::Base
  belongs_to :player_profile
  belongs_to :recruiter_profile
  has_many :messages
  accepts_nested_attributes_for :messages

  def meaty?
    self.messages.any?
  end
end
