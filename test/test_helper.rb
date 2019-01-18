ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'
require 'minitest/autorun'

# Capybara and shoulda for more verbose tests
require 'capybara/rails'
require 'shoulda/context'

# Improved Minitest output (color and progress bar)
require 'minitest/reporters'
require 'json'

# To generate Rspec-like test results, you know, the green dots...
Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
    def assert_valid(model, msg = nil)
    valid = model.valid?
    errors = model.errors.full_messages.join(', ')
    msg = message(msg) { "Expected #{model} to be valid, but got errors: #{errors}." }
    assert valid, msg
  end  
end

class ActionDispatch::IntegrationTest
  include Capybara::DSL
end