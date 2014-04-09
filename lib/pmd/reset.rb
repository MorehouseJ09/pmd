module PMD

  class Reset

    def initialize

    end

    def execute!
      counter = Counter.new
      counter.reset
    end

  end


end
