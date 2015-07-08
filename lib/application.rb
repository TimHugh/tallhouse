require 'response'

class Application < TwilioServer::Base
  def self.respond
    Response.new(params)
  end
end
