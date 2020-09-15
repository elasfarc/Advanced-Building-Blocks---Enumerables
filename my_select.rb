module Enumerable
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
end

(1...100).my_select { |num|  num.even?  }  #[2, 4]

