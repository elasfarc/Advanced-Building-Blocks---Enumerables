module Enumerable
    def my_map(optional_parameter = nil)
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
       retun_array = []
 
        #2nd step dealing with the case when no argument and no block 
       if block_given? == false 
        return to_enum
       end
 
        #3rd step dealing with normal case -> no argument and a block is given 
       while (i < n)
 
         returned_value = yield converted_array[i]
         retun_array.push(returned_value)
          i +=1
 
       end
        retun_array
   end
 end

pp (1..4).my_map     #=> [1, 4, 9, 16]