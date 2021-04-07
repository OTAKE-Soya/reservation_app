require 'test_helper'

class Users::BandsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get users_bands_show_url
    assert_response :success
  end

  test "should get edit" do
    get users_bands_edit_url
    assert_response :success
  end

  test "should get index" do
    get users_bands_index_url
    assert_response :success
  end

  test "should get new" do
    get users_bands_new_url
    assert_response :success
  end

end
