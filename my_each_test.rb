module Enumerable
def my_each()
    
  # build a loop around the given array
  n = self.length
  i = 0
  while i < n
    yield self[i] # [1, 2, 3]
    i += 1
  end

  self
end
end

# array_x = my_each([1, 2, 3]) do |num|
#   pp "number is #{num}"
# end

#pp "array_x is #{array_x}"

[1, 2, 3].my_each() do |num|
    pp "number is #{num}"
  end

  a = { "one" => 1, "two" => 2 }
  a.my_each() do |key, value|
      pp "#{key} is #{value}"
    end