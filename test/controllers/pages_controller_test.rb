require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get pages_top_url
    assert_response :success
  end

  test "should get profile" do
    get pages_profile_url
    assert_response :success
  end
end
