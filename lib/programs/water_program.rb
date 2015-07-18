module Programs
  class WaterProgram < Program
    include DatabaseService
    include UserService

    @trigger = /water|garden/i

    def init
      @db = open_database

      action /.*/ do |params|
        # fetch most recent watering
        last_watering = db.find().sort({ _id: -1 }).limit(1).first

        # record watering timestamp
        log_watering(User.find_by_phone(params['From']))

        # check last watering timestamp
        
          # if it was recently, say something

          # otherwise, normal response
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
