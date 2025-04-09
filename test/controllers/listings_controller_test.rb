require "test_helper"

class ListingsControllerTest < ActionDispatch::IntegrationTest
  def sign_in_as(user)
    post login_url, params: { username: user.username, password: "password" }
  end
  setup do
    @user = User.create(username: "testuser", password: "password")
    sign_in_as(@user)
  end
  test "should get index" do
    get listings_url
    assert_response :success
  end
end
