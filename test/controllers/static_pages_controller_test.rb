require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Gabble"
    @user = users(:tes)
  end
  
  test "should get home" do
    log_in_as(@user)
    get home_path
    assert_response :success
  end

  test "should get show" do
    get show_path
    assert_response :success
  end

end
