require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Gabble"
  end
  
  test "should get home" do
    get static_pages_home_url
    assert_response :success
  end

  test "should get show" do
    get static_pages_show_url
    assert_response :success
  end

end
