def my_each(array)
  # build a loop around the given array
  n = array.length
  i = 0
  while i < n
    yield array[i] # [1, 2, 3]
    i += 1
  end

  array
end

# array_x = my_each([1, 2, 3]) do |num|
#   pp "number is #{num}"
# end

#pp "array_x is #{array_x}"

[1, 2, 3].my_each() do |num|
    pp "number is #{num}"
  end