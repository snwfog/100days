# start from 2, (cause 1 is not a prime number)
# mark all multiple of 2 excluding 2, then start from 3,
# mark all multiple of 3, excluding 3, ...
# the left overs are the prime numbers
# refinement 1. can omit all the even number
# refinement 2. can start from p^2 instead of 2*p

def eratosthenes(n)
	p_set = (3..n).step(2).to_a
	p = 3
	i = 0
	while p && p ** 2 <= n 
		D 'set is...'
		D p_set.inspect

		c = 2

		while (mul = p * c) <= n 
			D "value is #{mul}, value position #{mul/2-1}"
			D "value setting to nil #{p_set[mul/2-1]}"
			if mul.odd?
				p_set[mul/2 - 1] = nil
			end
			c += 1
		end

		D 'picking next p..'
		i += 1
		
		while p_set[i].nil? && i < n
			i += 1 
			D "Start index #{i}"
			D p_set.inspect
		end

		if i < n
			p = p_set[i]
			D "next p is #{p}"
		else
			D "finish"
			break
		end
	end

	I p_set.compact.join(',')
	puts p_set.compact.size
	# + 1 because 2 was excluded
end

def D(msg)
	# puts msg
end

def I(msg)
	# puts msg
end

eratosthenes(ARGV[0].to_i)
