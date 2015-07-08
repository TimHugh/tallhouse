require 'bundler'
Bundler.require(:default, ENV['RACK_ENV'])

module Environment
  ROOT_PATH = File.dirname(__FILE__)
  LIB_PATH = File.join(ROOT_PATH, 'lib')
end
$LOAD_PATH.unshift Environment::LIB_PATH

require 'core_extensions/all'
require 'application'
