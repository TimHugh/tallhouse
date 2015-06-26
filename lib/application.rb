class Application < Sinatra::Base
  get '/' do
    status 200
  end

  get '/sms' do
    create_response(dispatch_message(params))
  end

  def dispatch_message(message_params)
    ProgramManager.new.respond(message_params)
  rescue ProgramManager::UnknownCommand
    "I don't know what that means! 🙈"
  rescue ProgramManager::MissingCommand
    "What? I can't hear you! 🙉"
  end

  def create_response(message)
    twiml = Twilio::TwiML::Response.new { |r| r.Message message }
    twiml.text
  end
end
