require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

class Application < Sinatra::Base
  configure do
    set :root, File.absolute_path(File.dirname(__FILE__))
    set :lib_dir, File.join(settings.root, 'lib')
  end
end

$LOAD_PATH.unshift Application.lib_dir
require 'core_extensions/all'
require 'application'
