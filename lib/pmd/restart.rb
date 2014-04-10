require 'fileutils'

module PMD

  class Restart

    def initialize

    end

    def self.restarted
      if File.exists? Config.restart_path
        FileUtils.rm Config.restart_path
        return true
      else
        return false
      end
    end

    def execute!
      FileUtils.touch Config.restart_path
    end

  end

end
