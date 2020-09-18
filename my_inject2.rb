# ## block-given? 

# ## no  
# (5..10).inject(100, :+)   --------------------------> (A )  -> converted_array.my_inject(100) {|sum, n| sum + n}
# (5..10).inject(:+)      --------------------------> B
# ##(5..10).inject(100)  XXXXXXX 
# #(5..10).inject(:+) { BLOCK }   XXXXXXXXX    +++++++++++

# ## yes 

# (5..10).inject { BLOCK }      --------------------------> C  
# (5..10).inject(100) { BLOCK }   --------------------------> D 

# (5..10).inject(100, :+) { BLOCK }  --------------------------> (E )      



#  1-   if optional_parameters both == true 
#        A, E

# 2 - block_given? NO, one_of_the_argu == true  (check this argu against if its symbol) -> if not symbol then ERROR
#     B

# 3 - C, D  (the default case)

module Enumerable

    def my_inject(*argu)    

 
       converted_array = self.to_a
       n = converted_array.length
       i = 0 
       memo = 0    ################################
    
         #################################################################################################################
                # if both optional arguments are provided  -> inject(initial, sym) [with or without a block]
        #################################################################################################################

    if (!!argu[0] && !!argu[1]) 
        pp "The block will be ignored" if block_given?
        argu[1] = argu[1].to_sym
        memo = converted_array.my_inject(argu[0]) {|sum, n| sum.method(argu[1]).(n)}
        return memo
    end


        #################################################################################################################
             # no block is given and only one argument is provided [symbol :+],  if no-block && no argu -> error 
                                      #                                          if no--block && argu != symbol -> error
        #################################################################################################################

    # (5..10).inject(:+) ---> (5..10).my_inject() {|sum, n| sum () n}

    unless block_given? 
        return "no-block no-argument ----> ERROR" unless argu[0]
        return "When no-block, argument should be a binary operation symbol" unless argu[0].class.to_s == "String" ||  argu[0].class.to_s == "Symbol"  

        argu[0] = argu[0].to_sym
        memo = converted_array.my_inject() {|sum, n| sum.method(argu[0]).(n)}
        return memo
    end


        #################################
                 # Default case
        #################################

        
        if !!argu[0] 
            return "Block is given && only one argument is provided ----> argu[0] must be a numeric value" unless argu[0].class == Numeric 
            memo = argu[0]

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


  #pp (5..10).my_inject(1){ |sum, n| sum + n } 

#pp (5..10).my_inject(1,:*){ |product, n| product * n } #-- 45



#pp (5..10).my_inject(1,'+') {|sum, n| sum / n}

##pp (5..10).my_inject(:%) 

pp (5..10).my_inject(:*) { |sum, n| sum + n }  

