ENV['RACK_ENV'] = 'test'

require_relative '../app/app'

require 'minitest/autorun'
require 'rack/test'
require 'byebug'

# Require the rack-test methods for all test files.
class Minitest::Test
  include Rack::Test::Methods
end

# Required by rack-test.
def app
  App.new
end

# Helper methods for all tests go below...

def status
  last_response.status
end

def body
  last_response.body
end

def refute_empty_response
  assert_equal 200, status
  refute_empty body
end
