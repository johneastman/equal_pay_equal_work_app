require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email should be unique" do
    user = User.new(email: "email@example.com")
    user.save
    
    assert_not User.new(email: "email@example.com").save
  end
end
