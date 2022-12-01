require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "email should be unique" do

    email = "email@example.com"

    user = User.new(email: email)
    user.save
    
    # Try saving another user with the same email as above
    assert_not User.new(email: email).save
  end
end
