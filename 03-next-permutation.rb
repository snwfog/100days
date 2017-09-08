# start from inverse
# find the longest decreasing sequence
# denote preceeding item as pivot
# swap with next smallest
# reverse everything

def D(msg)
	puts msg
end

def next_permutation(seq)
	return seq if seq.length == 1
	found = false
	seq_rev = seq.reverse

	last_char_idx = seq_rev.length - 1
	last_char = seq[last_char_idx]

	seq_rev.each_with_index do |c, idx|
		D "current char #{c}, current index: #{idx}"
		D "last char #{last_char}, last index: #{last_char_idx}"
		next unless idx > 0

		if c >= last_char
			D "#{c} is greater than #{last_char}"
			last_char = c
			last_char_idx = seq.length - idx - 1
			D "new last char: #{last_char}, new index: #{last_char_idx}"
		else
			break
		end

		if idx == seq.length - 1 && last_char_idx == 0
			D "already last element"
			found = true
		end
	end

	D "final last char #{last_char}, final idx #{last_char_idx}"
	if !found && last_char_idx == seq.length - 1
		# trivial, swap last 2 elements
		D "found trivial"
		seq[-1], seq[-2] = seq[-2], seq[-1]
		found = true
	elsif !found && last_char_idx > 0
		D "handling special case"
		pivot_idx = last_char_idx - 1
		pivot_char = seq[pivot_idx]
		D "pivot char #{pivot_char}, pivot idx #{pivot_idx}"

		to_pivot_idx = last_char_idx
		to_pivot_char = seq[last_char_idx]

		seq[last_char_idx+1..-1].each_with_index do |c, idx|
			if c >= pivot_char && c < to_pivot_char
				to_pivot_char = c
				to_pivot_idx = last_char_idx + idx + 1
				D "to pivot char #{to_pivot_char}, to pivot idx #{to_pivot_idx}"
			end
		end

		D "pivoting"
		seq[pivot_idx], seq[to_pivot_idx] = seq[to_pivot_idx], seq[pivot_idx]

		D "reverse"
		seq = seq[0..pivot_idx] + seq[last_char_idx..-1].reverse
		found = true
	end

	if found
		seq
	end
end

puts next_permutation(ARGV[0].dup.each_char.to_a)

