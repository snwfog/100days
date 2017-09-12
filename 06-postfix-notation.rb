require_relative './helper'

# Note, not handling edge cases
# 15 7 1 1 + - / 3 * 2 1 1 + + - = 
# 5
def postfix(equation)
  stack = []
  eq = equation.split(/ /)

  while op = eq.shift
    unless %w(+ - * /).include?(op)
      stack.push(op)
      D stack
    else
      rvalue = stack.pop.to_i
      lvalue = stack.pop.to_i
      D "#{lvalue} #{op} #{rvalue}"
      result = case op
      when '+' then lvalue + rvalue
      when '-' then lvalue - rvalue
      when '*' then lvalue * rvalue
      when '/' then lvalue / rvalue
      end

      D "result #{result}"
      stack.push(result)
    end
  end

  D eq
  puts stack.first
end

$debug = false
postfix(ARGV[0])