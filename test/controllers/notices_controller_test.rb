require 'test_helper'

class NoticesControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tes)
  end
  
  test "should get new" do
    log_in_as(@user)
    get new_notice_path
    assert_response :success
  end

end
