module Enumerable

    def my_inject( bianry_operation_used = :nil, optional_initial_value_memo = nil)

 
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
       memo = 0    ################################
    

       #pp (5..10).my_inject(1,:+ +){ |product, n| product * n } #-- 45

        #########################################################################
          # if both optional arguments are provided  -> inject(initial, sym)
        #########################################################################
        bianry_operation_used = bianry_operation_used.to_sym
        

        if (bianry_operation_used != :nil)
            #return optional_initial_value_memo 
            memo = converted_array.my_inject(:nil, optional_initial_value_memo) {|counter, element| counter.method(bianry_operation_used).(element)}
            return memo
        end

        #################################
        # detecting binary operation  
        #################################   

        if bianry_operation_used # a symbol is provided  (5..10).reduce(:+) -- 45
        end 
        
        
        #################################
        # a block is given & no argument 
        #################################

        
        if !!optional_initial_value_memo 
            memo = optional_initial_value_memo

        else 
            memo = converted_array[i]
            i = 1
        end

        while (i < n)
        memo =  yield memo, converted_array[i]
        i +=1
       end
       memo



    end
 end


# pp (5..10).my_inject(100) { |sum, n| sum + n } # [5, 6, 7, 8, 9, 10]
 #pp (5..10).my_inject(:*)        

 #pp (5..10).my_inject(1) { |product, n| product * n } #=> 151200

 #pp (5..10).inject(''){ |product, n| product * n } #-- 45

  #pp (5..10).my_inject(1,'*'){ |product, n| product * n } #-- 45
 #pp (5..10).my_inject(1) {|sum, num| sum + num}

 #sum = (5..10).my_inject(1) {|counter, element| counter + element}


  pp (5..10).my_inject(1){ |sum, n| sum + n } 

#pp (5..10).my_inject(1,:*){ |product, n| product * n } #-- 45