require "test_helper"

class ResevationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get resevations_index_url
    assert_response :success
  end

  test "should get new" do
    get resevations_new_url
    assert_response :success
  end

  test "should get confirm" do
    get resevations_confirm_url
    assert_response :success
  end
end
