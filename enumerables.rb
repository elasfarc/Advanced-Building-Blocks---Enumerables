module Enumerable
    def my_each()
        # build a loop around the given array
        n = self.length
        i = 0
        while i < n
          yield self[i] # [1, 2, 3]
          i += 1
        end
      
        self
    end
end


a = { "one" => 1, "two" => 2 }
a.my_each() do |key, value|
    pp "#{key} is #{value}"
  end