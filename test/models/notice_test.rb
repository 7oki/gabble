require 'test_helper'

class NoticeTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:tes)
    @notice = @user.notices.build(content: "Lorem ipsum",reason: "asgD")
  end
   test "should be valid" do
    assert @notice.valid?
  end

  test "user id should be present" do
    @notice.user_id = nil
    assert_not @notice.valid?
  end
  
  test "content should be present" do
    @notice.content = "   "
    assert_not @notice.valid?
  end
  
  test "order should be most recent first" do
    assert_equal notices(:most_recent), Notice.first
  end
end
