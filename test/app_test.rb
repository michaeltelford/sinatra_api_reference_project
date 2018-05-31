require 'test_helper'

class AppTest < Minitest::Test
  def test_get_healthcheck
    get '/healthcheck'
    assert_equal 200, status
  end
end
