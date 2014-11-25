require "test_helper"

class TierTest < ActiveSupport::TestCase

  def tier
    @tier ||= Tier.new
  end

  def test_valid
    assert tier.valid?
  end

end
