require "test_helper"

class PositionSearchTest < ActiveSupport::TestCase

  def position_search
    @position_search ||= PositionSearch.new
  end

  def test_valid
    assert position_search.valid?
  end

end
