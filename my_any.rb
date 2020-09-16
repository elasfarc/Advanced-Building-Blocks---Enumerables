module Enumerable
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
 end

 
pp %w[ant bear cat].any? { |word| word.length >= 3 } #=> true
pp %w[ant bear cat].any? { |word| word.length >= 4 } #=> true
pp %w[ant bear cat].any?(/d/)                        #=> false
pp [nil, true, 99].any?(Integer)                     #=> true
pp [nil, true, 99].any?                              #=> true
pp [].any?      