module PMD

  class Counter

    def initialize
      @value = 0
      if File.exists? Config.counter_path
        File.open Config.counter_path, "r" do |file|
          file_value = file.read
          if file_value and file_value.to_i
            @value = file_value.to_i
          end
        end
      end
    end

    def value
      # return current value
      return @value
    end

    def reset
      @value = 0
      write @value
    end

    def increase
      @value = @value + 1
      write @value
    end
    
    private
    def write(value)
      File.open Config.counter_path, "w" do |file|
        file.write value
      end
    end

  end
end
