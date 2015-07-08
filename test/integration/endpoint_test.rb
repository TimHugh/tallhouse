require 'test_helper'

class EndpointTest < Test
  include Rack::Test::Methods

  def app
    Application
  end

  def test_response
    get '/'
    assert last_response.ok?
  end
end
