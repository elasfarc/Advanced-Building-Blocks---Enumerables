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

    def my_each_with_index()
      
        converted_array = self.to_a
        n = converted_array.length
        i = 0
        while i < n
          yield converted_array[i], i # [1, 2, 3]
          i += 1
        end
      
        self
    end


    def my_select ()
        converted_array = self.to_a
        i = 0
        returned_array = []
        while i < converted_array.length
           conditional_met = yield converted_array[i]
           if conditional_met == true
            returned_array.push(converted_array[i])
           end
            i += 1
        end
        returned_array
    end  

    def my_all?(optional_parameter = nil)
        converted_array = self.to_a
        n = converted_array.length
        i = 0 
 
        # first step to deal with the given argument and ignore the bloczk if was given
         unless optional_parameter == nil
             puts " warning: given block not used " if block_given?
            dummy_flag = converted_array.my_all? {|element| element.is_a?(optional_parameter) }
            return false if dummy_flag == false
            return true 
         end
 
 
         #2nd step dealing with the case when no argument and no block 
        if block_given? == false 
         dummy_flag = converted_array.my_all? {|obj| !!obj == false }
         return false if dummy_flag == false 
         return true
         #return "no-block && converted-Array is #{converted_array}"
        end
 
         #3rd step dealing with normal case -> no argument and a block is given 
        while (i < n)
 
          returned_flag = yield converted_array[i]
 
           unless (returned_flag)   # if (returned_flag == false )
              return false
           end
           i +=1
  
        end
         true
    end

    
      



end




