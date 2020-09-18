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

    def my_any?(optional_parameter = nil)
        converted_array = self.to_a
        n = converted_array.length
        i = 0 
 
        # first step to deal with the given argument and ignore the bloczk if was given
         unless optional_parameter == nil
             puts " warning: given block not used " if block_given?
            dummy_flag = converted_array.my_any? {|element| element.is_a?(optional_parameter) }
            return false if dummy_flag == false
            return true 
         end
 
 
         #2nd step dealing with the case when no argument and no block 
        if block_given? == false 
         dummy_flag = converted_array.my_any? {|obj| !!obj == false }
         return false if dummy_flag == false 
         return true
         #return "no-block && converted-Array is #{converted_array}"
        end
 
         #3rd step dealing with normal case -> no argument and a block is given 
        while (i < n)
 
          returned_flag = yield converted_array[i]
 
           if (returned_flag)   # if (returned_flag == false )
              return true
           end
           i +=1
  
        end
         false
    end

    def my_none?(optional_parameter = nil)
        converted_array = self.to_a
        n = converted_array.length
        i = 0 
 
        # first step to deal with the given argument and ignore the bloczk if was given
         unless optional_parameter == nil
             puts " warning: given block not used " if block_given?
            dummy_flag = converted_array.my_none? {|element| element.is_a?(optional_parameter) }
            return false if dummy_flag == false
            return true 
         end
 
 
         #2nd step dealing with the case when no argument and no block 
        if block_given? == false 
 
          for i in converted_array
             return false  if !!i == true
          end
          return true 
 
        end
 
         #3rd step dealing with normal case -> no argument and a block is given 
        while (i < n)
 
          returned_flag = yield converted_array[i]
 
           if (returned_flag)   # if (returned_flag == false )
              return false
           end
           i +=1
  
        end
        true
    end

    def my_count(optional_parameter = nil)
        converted_array = self.to_a
        n = converted_array.length
        i = 0 
        condition_met_counter = 0
 
        # first step to deal with the given argument and ignore the bloczk if was given
 
         # unless optional_parameter == nil
         #     puts " warning: given block not used " if block_given?
         #    dummy_flag = converted_array.my_count {|element| element.is_a?(optional_parameter) }
         #    return false if dummy_flag == false
         #    return true 
         # endop
 
 
 
         # ary = [1, 2, 4, 2]
         # ary.count(2)            #=> 2   
 
         if optional_parameter 
             for i in converted_array 
                
                if i == optional_parameter
                
                 condition_met_counter +=1
                end
                 
             end
                
                 return condition_met_counter
         end
        
 
         #2nd step dealing with the case when no argument and no block 
         return n unless block_given?
         #return "no-block && converted-Array is #{converted_array}"
        
 
         #3rd step dealing with normal case -> no argument and a block is given 
        while (i < n)
 
          returned_flag = yield converted_array[i]
 
           if (returned_flag)   # if (returned_flag == false )
             condition_met_counter += 1
           end
           i +=1
  
        end
        condition_met_counter
    end

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




