require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

class Application < Sinatra::Base
  configure do
    set :root, File.dirname(__FILE__)
  end
end

require_rel 'lib/core_extensions/**/*.rb'
require_relative 'lib/application.rb'
