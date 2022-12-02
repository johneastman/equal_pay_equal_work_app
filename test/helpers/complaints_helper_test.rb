require "test_helper"

class ComplaintsHelperTest < ActionView::TestCase

  # display_boolean
  test "boolean value is true" do
    assert display_boolean(true) == "Yes"
  end

  test "boolean value is false" do
    assert display_boolean(false) == "No"
  end

  # users_complaint?
  test "false when current user is nil" do
    current_user = nil
    complaint_user = User.new

    assert_not users_complaint?(current_user, complaint_user)
  end

  test "false when current user is not the same as complaint user" do
    current_user = User.new
    complaint_user = User.new

    assert_not users_complaint?(current_user, complaint_user)
  end

  test "true when current user is the same as complaint user" do
    current_user = User.new
    complaint_user = current_user

    assert users_complaint?(current_user, complaint_user)
  end

end
