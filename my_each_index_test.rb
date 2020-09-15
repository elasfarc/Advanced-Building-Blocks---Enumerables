
    def my_each_index()
        # build a loop around the given array
        n = self.length
        i = 0
        while i < n
          yield self[i], i # [1, 2, 3]
          i += 1
        end
      
        self
    end



a = [1,5,8,4,9]
a.my_each_index() do |num, index|
    pp "my number is #{num} and my index is #{index}"
  end

