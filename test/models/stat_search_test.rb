require "test_helper"

class StatSearchTest < ActiveSupport::TestCase

  def stat_search
    @stat_search ||= StatSearch.new
  end

  def test_valid
    assert stat_search.valid?
  end

end
