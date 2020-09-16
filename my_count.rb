# count → intclick to toggle source
# count(item) → int
# count { |obj| block } → int
# Returns the number of items in enum through enumeration. If an argument is given, the number of items in enum that are equal to item are counted. If a block is given, it counts the number of elements yielding a true value.

# ary = [1, 2, 4, 2]
# ary.count               #=> 4
# ary.count(2)            #=> 2
# ary.count{ |x| x%2==0 } #=> 3

#optional_parameter = self.to_a.length
module Enumerable
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
               
                condition_met_counter +=1   if i == optional_parameter
                
            end
               
                return condition_met_counter
        end
       

        #2nd step dealing with the case when no argument and no block 
       if block_given? == false 
        for i in converted_array 
        #dummy_flag = converted_array.my_count {|obj| obj }
        if i
        condition_met_counter +=1  
        end
    end
       
        return condition_met_counter
        #return "no-block && converted-Array is #{converted_array}"
       end

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
 end


 ary = [1, 2, 4, 2]
pp ary.count               #=> 4
pp ary.count(2)            #=> 2
pp ary.count{ |x| x%2==0 } #=> 3