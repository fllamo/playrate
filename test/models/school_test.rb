require "test_helper"

class SchoolTest < ActiveSupport::TestCase

  def school
    @school ||= School.new
  end

  def test_valid
    assert school.valid?
  end

end
