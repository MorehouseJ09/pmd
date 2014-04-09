module PMD

  class Pause

    def initialize

    end

    def execute!

      FileUtils.touch Config.pause_path

    end

  end


end
