require 'test_helper'

class StaticsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get statics_show_url
    assert_response :success
  end

end
