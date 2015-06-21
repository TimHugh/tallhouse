class Application < Sinatra::Base
  configure do
    set :root, File.absolute_path('.')
  end
end
