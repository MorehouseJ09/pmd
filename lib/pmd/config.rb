module PMD

  class Config

    @@base_dir = "/tmp/pmd"
    @@update_frequency = 1 # number of seconds between updates

    def self.base_dir
      return @@base_dir
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

  end

end
