require "test_helper"

class NoteBooksControllerTest < ActionController::TestCase
  def test_edit
    get :edit
    assert_response :success
  end

end
