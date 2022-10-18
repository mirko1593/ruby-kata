require "test_helper"

class SupportRequestControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get support_request_index_url
    assert_response :success
  end

  test "should get update" do
    get support_request_update_url
    assert_response :success
  end
end
