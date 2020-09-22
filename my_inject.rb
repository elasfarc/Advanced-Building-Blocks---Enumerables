module Enumerable
  def my_inject(*argu)
    converted_array = to_a
    n = converted_array.length
    i = 0
    memo = 0
    if !!argu[0] && !!argu[1]
      pp 'The block will be ignored' if block_given?
      argu[1] = argu[1].to_sym
      memo = converted_array.my_inject(argu[0]) { |sum, n| sum.method(argu[1]).call(n) }
      return memo
    end
    unless block_given?
      return 'no-block no-argument ----> ERROR' unless argu[0]
      unless argu[0].class.to_s == 'String' || argu[0].class.to_s == 'Symbol'
        return 'When no-block, argument should be a binary operation symbol'
      end

      argu[0] = argu[0].to_sym
      memo = converted_array.my_inject { |sum, n| sum.method(argu[0]).call(n) }
      return memo
    end
    if !!argu[0]
      unless argu[0].is_a?(Numeric)
        return 'Block is given && only one argument is provided ----> argu[0] must be a numeric value'
      end

      memo = argu[0]
    else
      memo = converted_array[i]
      i = 1
    end
    while i < n
      memo = yield memo, converted_array[i]
      i += 1
    end
    memo
  end
end

# Sum some numbers
# (5..10).reduce(:+)                             #=> 45
# Same using a block and inject
# (5..10).inject { |sum, n| sum + n }            #=> 45
# Multiply some numbers
# (5..10).reduce(1, :*)                          #=> 151200
# Same using a block
# (5..10).inject(1) { |product, n| product * n } #=> 151200
# find the longest word
# longest = %w{ cat sheep bear }.inject do |memo, word|
# memo.length > word.length ? memo : word
# end
# longest                                        #=> "sheep"

# pp (1..3).inject(4) { |prod, n| prod * n } ==
# pp (1..3).my_inject(4) { |prod, n| prod * n }

# pp [1,2,3].inject(4, :*) == [1,2,3].my_inject(4, :*)

pp (1..3).inject(4, :*) == (1..3).my_inject(4, :*)
