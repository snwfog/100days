def mccarthy_91_rec(value)
  if value > 100
    puts "M(#{value})"
    value - 10
  else
    puts "M(M(#{value + 11}))"
    mccarthy_91(mccarthy_91(value + 11))
  end
end

def mccarthy_91(value)
  k = 1
  while k > 0
    if value > 100
      value -= 10
      k -= 1
    else
      value += 11
      k += 1
    end
  end

  value
end

puts mccarthy_91_rec(ARGV[0].to_i)
puts mccarthy_91(ARGV[0].to_i)
