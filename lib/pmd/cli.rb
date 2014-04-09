require 'fileutils'

module PMD
  class CLI
    @@commands = {

      daemon: Daemon, #default as well
      help: Help,
      pause: Pause, # pause 
      stop: Stop,
      reset: Reset, # resets the file counter
    }

    @@aliases = {

      :daemon => :d,
      :help => :h,
      :pause => :p, # finished
      :stop => :s, # 
      :reset => :reset,
    }

    def initialize(argv, stdin=STDIN, stdout=STDOUT, stderr=STDERR, kernel=Kernel)
      @argv, @stdin, @stdout, @stderr, @kernel = argv, stdin, stdout, stderr, kernel
    end

    def execute!

      before
      command_class = subcommand
      command_class.new().execute!

    end

    private
    def before

      if not File.directory? Config.base_dir
        FileUtils.mkdir_p Config.base_dir
      end

    end

    def subcommand

      if not @argv.length > 0
        return Help
      end

      keyword = @argv[0].to_sym

      @@commands.each do |key, command_class|

        aliases = nil

        if @@aliases.has_key? key
          # grab the key and then fill the aliases hash properly
          value = @@aliases[key] 
          if value.kind_of?(Symbol)
            aliases = [value]
          else
            aliases = value
          end
        end

        if keyword == key or aliases.include? keyword 
          return command_class
        end
      end

      return Help
    end

  end
end


