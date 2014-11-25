require "test_helper"

class NoteBookTest < ActiveSupport::TestCase

  def note_book
    @note_book ||= NoteBook.new
  end

  def test_valid
    assert note_book.valid?
  end

end
