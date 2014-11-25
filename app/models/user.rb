require 'digest/md5'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true

  has_one :player_profile, dependent: :destroy
  has_one :recruiter_profile, dependent: :destroy
  accepts_nested_attributes_for :recruiter_profile

  attr_accessor :player_sign_up
  after_create :create_player_profile

  def is_admin?
    self.admin?
  end

  def is_player?
    self.player_profile.present?
  end

  def is_recruiter?
    self.recruiter_profile.present?
  end

  def profile
    self.player_profile || self.recruiter_profile
  end

  def gravatar(size = 130)
    "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=#{size}"
  end

  private

  def create_player_profile
    if self.player_sign_up == "1"
      player_profile = self.build_player_profile
      player_profile.save
    end
  end
end
