require_relative './helper'

def binary_add(x, y)
  max_length = [x.length, y.length].max
  x_arr = (x.rjust(max_length, '0')).each_char.to_a.reverse
  y_arr = (y.rjust(max_length, '0')).each_char.to_a.reverse

  p x_arr
  p y_arr

  i = 0
  carry = 0
  result = []

  while i < max_length
    sum = x_arr[i].to_i + y_arr[i].to_i + carry
    p sum.to_s(2)
    if sum == 2
      carry = 1
      sum = 0
    end

    result.unshift(sum)
    i += 1
  end

  if carry == 1
    result.unshift(carry)
  end

  p result.join
end

binary_add(*ARGV[0, 2])