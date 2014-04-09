require 'fileutils'

module PMD

  class Stop

    def initialize

    end

    def execute!

      FileUtils.touch Config.stop_path

    end

  end

end
