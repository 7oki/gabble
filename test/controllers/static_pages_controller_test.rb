require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Gabble"
  end
  
  test "should get home" do
    get home_path
    assert_response :success
  end

  test "should get show" do
    get show_path
    assert_response :success
  end

end
