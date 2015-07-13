Dir[File.join('lib', 'services', '**', '*.rb')].each { |f| require f.gsub('lib/', '') } #HACK
require 'response'

class Application < TwilioServer::Base
  def self.respond
    Response.new(params)
  end
end
