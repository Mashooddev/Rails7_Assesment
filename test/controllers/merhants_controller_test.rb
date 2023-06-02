require "test_helper"

class MerhantsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get merhants_index_url
    assert_response :success
  end

  test "should get destroy" do
    get merhants_destroy_url
    assert_response :success
  end

  test "should get create" do
    get merhants_create_url
    assert_response :success
  end

  test "should get show" do
    get merhants_show_url
    assert_response :success
  end

  test "should get update" do
    get merhants_update_url
    assert_response :success
  end
end
