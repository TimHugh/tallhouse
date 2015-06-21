require 'bundler'
Bundler.require

require './environment.rb'
require File.join(Application.root, 'lib', 'application.rb')
Dir[File.join(Application.root, 'lib', '**', '*.rb')].each { |f| require f }

run Application
