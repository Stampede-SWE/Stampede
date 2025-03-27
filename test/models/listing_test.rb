require "test_helper"

class ListingTest < ActiveSupport::TestCase
  def setup
    @user = User.create(username: "Alice", email: "alice@example.com", password_digest: "bruh")
    @listing = Listing.create(title: "Textbooks", description: "Used CS textbooks", price: 30.00, User_id: @user.id)
  end

  test "listing with matching title" do
    assert @listing.valid?
    assert_equal "Textbooks", @listing.title
    assert_equal @user.id, @listing.User_id
  end
end
