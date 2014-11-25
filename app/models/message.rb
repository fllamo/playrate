class Message < ActiveRecord::Base
  belongs_to :conversation, touch: true
  belongs_to :user
  validates :body, presence: true

  def formatted_body
    self.body.gsub(/\n/, '<br/>').html_safe
  end
end
