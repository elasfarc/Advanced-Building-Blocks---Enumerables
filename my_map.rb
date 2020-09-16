module Enumerable
    def my_map(optional_parameter = nil)
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
       retun_array = []
 
       # first step to deal with the given argument and ignore the bloczk if was given
        unless optional_parameter == nil
            puts " warning: given block not used " if block_given?
           dummy_flag = converted_array.my_map {|element| element.is_a?(optional_parameter) }
           return false if dummy_flag == false
           return true 
        end
 
 
        #2nd step dealing with the case when no argument and no block 
       if block_given? == false 
        dummy_flag = converted_array.my_map {|obj| !!obj == false }
        return false if dummy_flag == false 
        return true
        #return "no-block && converted-Array is #{converted_array}"
       end
 
        #3rd step dealing with normal case -> no argument and a block is given 
       while (i < n)
 
         returned_value = yield converted_array[i]
         retun_array.push(returned_value)
          #unless (returned_flag)   # if (returned_flag == false )
            # return false
          #end
          i +=1
 
       end
        retun_array
   end
 end

pp (1..4).my_map { |i| i*i }      #=> [1, 4, 9, 16]