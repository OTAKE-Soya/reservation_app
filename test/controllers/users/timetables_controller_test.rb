require 'test_helper'

class Users::TimetablesControllerTest < ActionDispatch::IntegrationTest
  test "should get edit" do
    get users_timetables_edit_url
    assert_response :success
  end

end
