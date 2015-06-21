require 'test_helper'

class EndpointTest < Test
  def test_root
    get '/'
    assert last_response.ok?
  end

  def test_default_response
    get '/sms'
    assert last_response.ok?
  end
end
