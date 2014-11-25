require "test_helper"

class RecruiterProfileTest < ActiveSupport::TestCase

  def recruiter_profile
    @recruiter_profile ||= RecruiterProfile.new
  end

  def test_valid
    assert recruiter_profile.valid?
  end

end
