require "test_helper"

class ApplicationHelperTest < ActionView::TestCase

  test "welcome_display when user first name not present" do
    user = User.new(email: "email@example.com")
    result = welcome_display(user)
    
    assert result == "Welcome!"
  end

  test "welcome_display when user is nil" do
    user = nil
    result = welcome_display(user)
    
    assert result == "Welcome!"
  end

  test "welcome_display when user first name is present" do
    user = User.new(first_name: "John")
    result = welcome_display(user)
    
    assert result == "Welcome, John!"
  end
end
