module Enumerable
  def my_all?(optional_parameter = nil)
    converted_array = to_a
    n = converted_array.length
    i = 0
    unless optional_parameter.nil?
      puts ' warning: given block not used ' if block_given?
      dummy_flag = converted_array.my_all? { |element| element == optional_parameter }
      return false if dummy_flag == false

      return true
    end
    if block_given? == false
      dummy_flag = converted_array.my_all? { |obj| obj }
      return false if dummy_flag == false

      return true
    end
    while i < n
      returned_flag = yield converted_array[i]
      return false unless returned_flag

      i += 1
    end
    true
   end
end

pp [nil, nil, false].my_all?
pp [true, -1, true].my_all?
