require 'bundler'
Bundler.require

class Application < Sinatra::Base
  configure do
    set :root, File.absolute_path('.')
  end
end

Dir[File.join(Application.root, 'lib', 'core_extensions', '**', '*.rb')].each { |f| require f }

require File.join(Application.root, 'lib', 'application.rb')

Dir[File.join(Application.root, 'lib', '*.rb')].each { |f| require f }
Dir[File.join(Application.root, 'lib', 'programs', '**', '*.rb')].each { |f| require f }
