module DatabaseService
  include Mongo

  def open_database(name = nil)
    program = name || binding.receiver.class.to_s.split('::').last
    environment = ENV["RACK_ENV"]
    Mongo::Client.new("mongodb://localhost:27017/#{program}#{environment}")
  end
end
