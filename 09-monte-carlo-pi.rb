require_relative './helper'

# This equation made it clear: 
# https://math.stackexchange.com/questions/19119/approximating-pi-using-monte-carlo-integration
# Amazing further reading: 
# https://math.stackexchange.com/questions/1635250/what-are-numerical-methods-of-evaluating-p1-z-leq-2-for-standard-normal-z
def pi(n)
  t = 0
  start_i = 0

  while start_i < n
    r = rand
    p = (1 - (r * r)) ** 0.5
    t += p
    start_i += 1
  end

  4 * t / n
end

puts pi(ARGV[0].to_i)

# 100 => 2.9803442591099962
# 1000 => 3.122941195354285
# 10000 => 3.1368825565118956
# 100000 => 3.1431401059580613