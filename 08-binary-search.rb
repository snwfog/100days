require_relative './helper'

def bsearch(hay, value)
  p hay
  p value
  start_i = 0
  end_i = hay.length - 1

  while start_i <= end_i
    mid_i = (end_i + start_i) >> 1 # note this can overflow
    m_val = hay[mid_i]

    if m_val > value
      p 'greater'
      end_i = mid_i - 1
    elsif m_val < value
      p 'lesser'
      start_i = mid_i + 1
    else
      return mid_i
    end
  end  
end

hay = ARGV[0].split(' ').map(&:to_i)
needle = ARGV[1].to_i
puts bsearch(hay, needle)
