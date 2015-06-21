require 'bundler'
Bundler.require

class Application < Sinatra::Base
  configure do
    set :root, File.absolute_path('.')
  end
end

require File.join(Application.root, 'lib', 'application.rb')
Dir[File.join(Application.root, 'lib', '**', '*.rb')].each { |f| require f }
