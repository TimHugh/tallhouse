require 'bundler'
Bundler.require

require './environment.rb'
Dir[File.join(Application.root, 'lib', '**', '*.rb')].each { |f| require f }

class Application < Sinatra::Base
  get '/sms' do
    create_response(dispatch_message(params))
  end

  def dispatch_message(message_params)
    ProgramManager.new.respond(message_params)
  rescue ProgramManager::UnknownCommand => e
    "I don't know what that means! 🙈"
  end

  def create_response(message)
    twiml = Twilio::TwiML::Response.new { |r| r.Message message }
    twiml.text
  end

  def command
    params[:Body].split(' ').first
  end
end
