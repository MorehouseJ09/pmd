require 'fileutils'

module PMD

  class Stop

    def initialize

    end

    def execute!

      FileUtils.touch Config.stop_path

    end

    def self.stopped
      if File.exists? Config.stop_path
        FileUtils.rm Config.stop_path
        return true
      end
      return false
    end

  end

end
