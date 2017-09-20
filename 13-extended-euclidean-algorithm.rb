# https://en.wikipedia.org/wiki/Extended_Euclidean_algorithm
#
def euc(a, b)
  r0, r1 = a, b
  p "#{r0}, #{r1}"
  loop do
    q, r = r0.divmod(r1)
    r0, r1 = r1, r
    break if r == 0
  end

  r0
end

def adv_euc(a, b)
  r0, r1 = a, b
  s0, t0 = 1, 0
  s1, t1 = 0, 1

  loop do
    q, r = r0.divmod(r1)
    r0, r1 = r1, r
    break if r == 0

    s_new = s0 - q * s1
    t_new = t0 - q * t1

    s0, s1 = s1, s_new
    t0, t1 = t1, t_new
  end

  [r0, s1, t1]
end

# puts euc(123434, 43232)
puts adv_euc(2*3*7*9*11, 6*12*13)
