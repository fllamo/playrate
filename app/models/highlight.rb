class Highlight < ActiveRecord::Base
  belongs_to :player_profile
  validates :video_url, presence: true
  validate :is_valid_url

  def title
    self.custom_title.present? ? self.custom_title : video_info.title
  end

  def video_info
    @video_info = VideoInfo.get(self.video_url)
  end

  def embed_url
    @url ||= video_info.embed_url
  end

  def is_valid_url
    if !video_info
      errors.add(:video_url, "isn't a valid youtube video URL")
    end
  end
end
