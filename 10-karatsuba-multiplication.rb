require_relative './helper'

$debug = 1
# The karatsuba algorithm is a way to do 
# integer multiplication, but saving some multiple rounds
# and replace it with addition. The general equation for
# karatsuba can be found in

# https://en.wikipedia.org/wiki/Karatsuba_algorithm


# The karatsuba is can be generalized with Toom-Cook algorithm
# for multiplication.

# https://en.wikipedia.org/wiki/Toom%E2%80%93Cook_multiplication

# At certain length of the integer, the multiplication
# is more efficient using Schonhage-strassen algorithm.

# https://en.wikipedia.org/wiki/Sch%C3%B6nhage%E2%80%93Strassen_algorithm

# The algorithm for doing integer multiplication falls into
# multiplication algorithm from

# https://en.wikipedia.org/wiki/Multiplication_algorithm

# Also, remember that master theorem can give the 
# big-O bound of a recursive algorithm

# https://en.wikipedia.org/wiki/Master_theorem
def karatsuba_10(x, y)
  min_length, max_length = [x.length, y.length].minmax

  # can replace this by using string concat 0
  base = 10 
  m = min_length-1

  if m == 0
    return (x.to_i * y.to_i).to_s
  end

  x_0 = x[-m..-1]
  y_0 = y[-m..-1]

  x_1 = x[0..(x.length - m - 1)]
  y_1 = y[0..(y.length - m - 1)]

  D 'karatsuba_10 ==='
  D "m #{m}"
  D "x_1 #{x_1+('0'*m)}"
  D "y_1 #{y_1+('0'*m)}"
  D "x_0 #{x_0}"
  D "y_0 #{y_0}"

  z_2 = karatsuba_10(x_1, y_1) + ('0'*(2*m))
  z_1 = add(karatsuba_10(x_1, y_0), karatsuba_10(x_0, y_1)) + ('0'*m)
  z_0 = karatsuba_10(x_0, y_0)

  D "z_2 #{z_2}"
  D "z_1 #{z_1}"
  D "z_0 #{z_0}"

  res = add(add(z_2, z_0), z_1)
  D "xy #{res}"
  res
end

def add(x, y)
  results = []
  max_length = [x.length, y.length].max
  x_padded = x.rjust(max_length, '0')
  y_padded = y.rjust(max_length, '0')

  carry ||= 0
  for i in 1..max_length
    a = x_padded[max_length - i].to_i
    b = y_padded[max_length - i].to_i

    c = a + b + carry
    if c >= 10
      carry = 1
      c %= 10
    else
      carry = 0
    end

    results = results.unshift(c)
  end

  if carry > 0
    results.unshift(carry)
  end

  results.join
end

def sub(x, y)
  if x.length < y.length || (x <=> y) == -1
    negative = true
    y, x = x, y
  end

  results = []
  max_length = [x.length, y.length].max
  x_padded = x.rjust(max_length, '0')
  y_padded = y.rjust(max_length, '0')

  borrow ||= 0
  for i in 1..max_length
    a = x_padded[max_length - i].to_i
    b = y_padded[max_length - i].to_i

    c = a - b - borrow
    if c < 0
      borrow = 1
      c += 10
    else
      borrow = 0
    end

    results = results.unshift(c)
  end

  if negative
    results = results.unshift('-')
  end

  results.join
end

puts karatsuba_10(ARGV[1], ARGV[2])
puts ARGV[1].to_i * ARGV[2].to_i

