module PMD

  class Pause

    def initialize

    end

    def self.is_paused
      
      if File.exists? Config.pause_path
        return true
      end
      return false
    end

    def execute!

      if not File.exists? Config.pause_path
        FileUtils.touch Config.pause_path
      else
        FileUtils.rm Config.pause_path
      end

    end
  end
end
