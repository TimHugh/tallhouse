require 'test_helper'

class EndpointTest < Test
  def test_root
    get '/'
    assert last_response.ok?
  end

  def test_sms_response
    get '/sms'
    assert last_response.ok?
  end
end
