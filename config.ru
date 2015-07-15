require_relative 'environment'

# TODO: only use Rack::Reloader in dev
use Rack::Reloader
run Application
