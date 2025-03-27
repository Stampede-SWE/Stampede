require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
    test "should get login page" do
        get root_url
        assert_response :success
    end
    # test "should get signup page" do
    #     get signup_url
    #     assert_response :success
    # end
    # test "get rails app" do
    #     get root_url
    #     assert_response :success
    # end
end