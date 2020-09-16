module Enumerable
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
        dummy_flag = converted_array.my_none? {|obj| !obj == false }
        return true if dummy_flag == false 
        return false
        #return "no-block && converted-Array is #{converted_array}"
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
 end

  pp %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
  pp %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
 # pp %w{ant bear cat}.my_none?(/d/)                        #=> true
  pp [1, 3.14, 42].my_none?(Float)                         #=> false
  pp [].my_none?                                           #=> true
  pp [nil].my_none?                                        #=> true
  pp [nil, false].my_none?                                 #=> true
  pp [nil, false, true].my_none?                           #=> false