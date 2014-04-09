
module PMD
  class CLI
    @@commands = {

      daemon: Daemon, #default as well
      help: Help,
      pause: Pause, # pause 
      reset: Reset, # resets the file counter

    }

    @@aliases = {

    }

    def initialize

    end

    def execute!

    end

  end
end


