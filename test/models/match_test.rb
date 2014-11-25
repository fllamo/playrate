require "test_helper"

class MatchTest < ActiveSupport::TestCase

  def match
    @match ||= Match.new
  end

  def test_valid
    assert match.valid?
  end

end
