module Enumerable
  def my_any?(optional_parameter = nil)
    converted_array = to_a
    n = converted_array.length
    i = 0
    if optional_parameter
      puts ' warning: given block not used ' if block_given?

      dummy_flag = if optional_parameter.is_a?(Regexp)
                     converted_array.my_any? { |element| !!element[optional_parameter] }

                   else
                     converted_array.my_any? { |element| element.is_a?(optional_parameter) }
                  end
      return false if dummy_flag == false

      return true
    end

    if block_given? == false
      dummy_flag = converted_array.my_any? { |obj| !!obj == false }
      return false if dummy_flag == false

      return true
    end
    while i < n
      returned_flag = yield converted_array[i]
      return true if returned_flag

      i += 1
    end
    false
    end
end

# pp [1,'',[]].any?(Numeric) ==  [1,'',[]].my_any?(Numeric)

pp %w[og cat].my_any?(/d/) { |n| n }

# str = "dog"
# if str.include?("/d/").to_s
# pp "str.include(/d/)"
# else
# pp "________________"
# end
