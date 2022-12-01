require "test_helper"

class ComplaintsHelperTest < ActionView::TestCase

  test "boolean value is true" do
    assert display_boolean(true) == "Yes"
  end

  test "boolean value is false" do
    assert display_boolean(false) == "No"
  end
end
