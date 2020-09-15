#Passes each element of the collection to the given block. The method returns true if the block never returns false or nil.

#If the block is not given, Ruby adds an implicit block of { |obj| obj } which will cause all? to return true when none of the collection members are false or nil.

#[1, 2i, 3.14].all?(Numeric)                       #=> true
#[nil, true, 99].all?                              #=> false
# [].all?                                           #=> true

module Enumerable
    def my_all?()
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
 
       if block_given? == false 
        dummy_flag = converted_array.my_all? {|obj| !!obj == false }
        return false if dummy_flag == false 
        return true
        #return "no-block && converted-Array is #{converted_array}"
       end

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
 
 
 
 
 #value = %w[anfkl ant bear cat].my_all? { |word| word.length >= 3 } #=> true
 
 #value2 = (1..100).my_all? {|n| n.even?}
 
 #value3 = [1, 2i, 3.14].my_all?(Numeric)  
 
 
 #pp value3
 
 #a = { "one" => 1, "two" => 2 }
  #value4 =a.my_all? {|k, v| k == v}
 
  #pp value4


  #valueg = [nil, true, 99].my_all?  

  #pp valueg
 
 c = [].my_all?

 pp c