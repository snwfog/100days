# aka hamming weight
# counts the number of 1 bit sets
# useful for cryptography and others

# simple to remember
# efficient if there are more zero's than one's
def popcount(int_value)
  D "Counting 1s for #{int_value.to_s(2)}"
  count = 0
  while int_value > 0
    count += 1
    int_value &= int_value - 1
  end

  count
end

def popcount_naive(int_value)
  D 'Count 1s for %032b' % int_value
  x = int_value
  # jumps = [2, 4, 8, 16, 32]
  const = [0x5555_5555_5555_5555, # 0101 0101 0101
           0x3333_3333_3333_3333,
           0x0f0f_0f0f_0f0f_0f0f,
           0x00ff_00ff_00ff_00ff,
           0x0000_ffff_0000_ffff,
           0x0000_0000_ffff_ffff]
  # extra 2 bits
  x = (x & const[0]) + ((x >> 1) & const[0])
  D '>> 1 %032b' % x

  x = (x & const[1]) + ((x >> 2) & const[1])
  D '>> 2 %032b' % x

  x = (x & const[2]) + ((x >> 4) & const[2])
  D '>> 4 %032b' % x

  x = (x & const[3]) + ((x >> 8) & const[3])
  D '>> 8 %032b' % x

  x = (x & const[4]) + ((x >> 16) & const[4])
  D '>> 16 %032b' % x

  x = (x & const[5]) + ((x >> 32) & const[5])
  D '>> 32 %032b' % x
  x
end

def popcount_recur(value)
  if value == 0
    0
  else
    value % 2 + popcount_recur(value / 2)
  end
end

def D(msg)
  # puts msg
end

puts(popcount_recur ARGV[0].to_i)
