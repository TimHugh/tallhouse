module UserService
  class User
    attr_accessor :id, :name
    @@id = 0

    def initialize(params = {})
      @id = params[:id] || @@id
      @name = params[:name]

      @@id += 1 if @@id <= @id
    end

    class << self
      def find_by_phone(_phone)
        # TODO: actually find a user
        User.new(id: 1, name: 'Tim')
      end
    end
  end
end
