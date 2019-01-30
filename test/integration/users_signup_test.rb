require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:tes2)
    @admin_user = users(:tes)
  end
  
  test "invalid signup when logged in as not admin" do
    log_in_as(@user)
    get signup_path
    assert_redirected_to root_path
  end
  
  test "invalid signup information" do
    log_in_as(@admin_user)
    get signup_path
    assert_no_difference 'User.count' do
      post signup_path, params: { user: { name:  "",
                                         email: "user@invalid",
                                         password:              "foo",
                                         password_confirmation: "bar" } }
    end
    assert_template 'users/new'
    assert_select 'form[action="/signup"]'
  end
  
  test "valid signup information" do
    log_in_as(@admin_user)
    get signup_path
    assert_difference 'User.count', 1 do
      post users_path, params: { user: { name:  "Example User",
                                         email: "123123a@ugs.kochi-tech.ac.jp",
                                         login_name: "123123a",
                                         password:              "password",
                                         password_confirmation: "password" } }
    end
    follow_redirect!
    assert_template 'users/show'
    assert is_logged_in?
  end
  
end