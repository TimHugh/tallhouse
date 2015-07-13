module Programs
  class WaterProgram < Program
    include DatabaseService
    include UserService

    @trigger = /water|garden/i

    def init
      @db = open_database

      action /.*/ do |params|
        log_watering(User.find_by_phone(params['From']))
        [
          "Thanks for watering! 🌻🎉",
          "Happy flowers, happy garden! 🌻😄"
        ].random
      end
    end

    private

    def log_watering(user)
      db.insert_one(user: user.id, timestamp: DateTime.now)
    end

    def db
      @db[:waterings]
    end
  end
end
