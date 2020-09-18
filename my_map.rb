module Enumerable
    def my_map(proc = nil)
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
       retun_array = []

      if proc == nil
       return to_enum unless block_given? 

          while ( i < n)
            returned_value = yield converted_array[i]
            retun_array.push(returned_value)
           i +=1
          end
      else

       while (i < n)
         returned_value = proc.call(converted_array[i])   
         retun_array.push(returned_value)
        i +=1
        end
      end

        retun_array
   end
 end

#pp (1..4).my_map{|n| n+n}     #=> [1, 4, 9, 16]


my_proc = Proc.new do|n|

  n  * n
  
end
pp (1..4).my_map() 
# 1 4 9 16
# 2 8 18 32



