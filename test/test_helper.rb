ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  #
  # Comment out due to this error:
  # ActiveRecord::NotNullViolation: RuntimeError: NOT NULL constraint failed: complaints.employer_id
  # fixtures :all

  # Add more helper methods to be used by all tests here...
end
