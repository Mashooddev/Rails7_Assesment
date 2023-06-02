require "test_helper"

class TranactionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tranactions_index_url
    assert_response :success
  end

  test "should get destroy" do
    get tranactions_destroy_url
    assert_response :success
  end

  test "should get create" do
    get tranactions_create_url
    assert_response :success
  end

  test "should get show" do
    get tranactions_show_url
    assert_response :success
  end

  test "should get update" do
    get tranactions_update_url
    assert_response :success
  end
end
