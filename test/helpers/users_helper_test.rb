require "test_helper"

class UsersHelperTest < ActionView::TestCase

  test "display_info data not present" do
    assert display_info("Name", [nil], ", ") == nil
  end

  test "display_info data list contains value that is not present" do
    assert display_info("Name", ["John", nil], ", ") == nil
  end

  test "display_info name with space separator" do
    assert display_info("Name", ["John", "Doe"], sep=" ") == "<strong>Name: </strong>John Doe<br>"
  end

  test "display_info address with default comma separator" do
    assert display_info("Address", ["123 Main St.", "New York", "NY", "12345"]) == "<strong>Address: </strong>123 Main St., New York, NY, 12345<br>"
  end
end
