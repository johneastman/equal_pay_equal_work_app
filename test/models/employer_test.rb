require "test_helper"

class EmployerTest < ActiveSupport::TestCase
  # setup and teardown
  # https://api.rubyonrails.org/v5.1/classes/ActiveSupport/Testing/SetupAndTeardown.html

  test "should not save employer without values" do
    employer = Employer.new
    assert_not employer.save
  end

  test "should save employer with values" do
    employer = Employer.new(
      name: "Generic Company Inc.",
      contact_person_name: "John Doe",
      mailing_address: "123 Main St.",
      city: "Nowhere",
      state: "OK",
      zipcode: "12345",
      phone_number: "(123) 456 - 7890",
      email_address: "email@example.com",
      website: "example.com"
    )
    assert employer.save
  end

  test "existing method returns object" do
    employer = Employer.new(
      name: "Generic Company Inc.",
      contact_person_name: "John Doe",
      mailing_address: "123 Main St.",
      city: "Nowhere",
      state: "OK",
      zipcode: "12345",
      phone_number: "(123) 456 - 7890",
      email_address: "email@example.com",
      website: "example.com"
    )
    employer.save

    assert Employer.existing(employer) == employer
  end

  test "existing method returns nil" do
    employer = Employer.new(
      name: "Generic Company Inc.",
      contact_person_name: "John Doe",
      mailing_address: "123 Main St.",
      city: "Nowhere",
      state: "OK",
      zipcode: "12345",
      phone_number: "(123) 456 - 7890",
      email_address: "email@example.com",
      website: "example.com"
    )
    
    # Because the employer object was not saved, it does not exist in the database
    assert Employer.existing(employer) == nil
  end
end
