# my_each, for array, hash and range 
module Enumerable
    def my_each()
      
      converted_array = self.to_a
      n = converted_array.length
      i = 0
      while i < n
        yield converted_array[i] # [1, 2, 3]
        i += 1
      end
    
      self
    end
end
    
    # array_x = my_each([1, 2, 3]) do |num|
    #   pp "number is #{num}"
    # end
    
    #pp "array_x is #{array_x}"
    
    [1, 2, 3].my_each() do |num|
        pp "number is #{num}"
      end
    
      a = { "one" => 1, "two" => 2 }


      a.my_each() do |key, value|
          pp "#{key} is #{value}"
        end


        my_range = (1..100)
        
        my_range.my_each() do |g|
            puts " element in the array is  #{g}"
        end