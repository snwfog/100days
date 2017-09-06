# Note:
# 1. Remember that at each step, its just solving the same problem with
#    a size - 1 stack.
# 2. At every step, the pylon changes position, and
#    the same problem is being solved
# 3. There is a middle point where we move the base to the final position
# 4. Then recursively solve.
def hanoi(size, left = 'left', middle = 'middle', right = 'right')
  hanoi(size - 1, left, right, middle) if size > 1
  puts "#{left} => #{right}"
  hanoi(size - 1, middle, left, right) if size > 1
end
