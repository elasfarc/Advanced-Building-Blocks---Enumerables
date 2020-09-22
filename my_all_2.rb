module Enumerable
  def my_all?(optional_parameter = nil)
    converted_array = to_a
    n = converted_array.length
    i = 0
    if optional_parameter
      puts ' warning: given block not used ' if block_given?
      dummy_flag = converted_array.my_all? { |element| element.is_a?(optional_parameter) }
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

pp [nil, true, 99].my_all?

# [true, [false]].all? ==

# pp [true, true].all? ==
pp [nil, nil].my_all?
