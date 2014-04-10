module PMD

  class Config

    @@base_dir = "/tmp/pmd"
    @@update_frequency = 1 # number of seconds between updates

    def self.base_dir
      return @@base_dir
    end

    def self.stop_path
      return File.join @@base_dir, "stop"
    end

    def self.pause_path
      return File.join @@base_dir, "pause"
    end

    def self.restart_path
      return File.join @@base_dir, "restart"
    end

    def self.counter_path
      return File.join @@base_dir, "counter"
    end

    # return seconds needed for pomodoro
    def self.pomodoro_length
      value = 25
      if ENV.key "POMODORO_LENGTH"
        value = ENV["POMODORO_LENGTH"].to_i
      end
      return value * 60
    end
    
    def self.break_length
      value = 3
      if ENV.key "POMODORO_BREAK_LENGTH"
        value = ENV["POMODORO_BREAK_LENGTH"].to_i
      end
      return value * 60
    end
  end
end
