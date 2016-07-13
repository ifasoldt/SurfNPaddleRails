require 'test_helper'

class AuthorTest < ActiveSupport::TestCase
  test "new author needs presence of name, picture" do
    author = Author.new
    refute author.valid?
    assert_equal [:name, :picture], author.errors.keys
    assert author.errors.messages[:name].include? "can't be blank"
    assert_equal author.errors.messages[:name], author.errors.messages[:picture]
  end
end
