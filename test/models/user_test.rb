require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Alice", email: "alice@example.com", password_digest: "bruh")
  end

  test "user with matching name" do
    assert @user.valid?
    assert_equal "Alice", @user.username
  end
end
