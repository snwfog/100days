def mult(lookup, *matrices)
	if matrices.length == 1
		matrices.first
	elsif matrices.length == 2
		a, b = matrices
		mult_a_b(a, b, lookup)
	else
		min_m = [
			mult_a_b(   mult(lookup, *matrices.dup[0..-2]),    matrices.last,                      lookup), 
		  mult_a_b(   matrices.first,                        mult(lookup, *matrices.dup[1..-1]), lookup)
	  ]
							 .min_by { |mult_results| 
								 # puts 'last ops: ' + mult_results[:operations].to_s
								 mult_results[:operations] 
							 }
		min_m
	end
end

def mult_a_b(a, b, lookup)
	arrangement = "(#{a[:arrangement]}, #{b[:arrangement]})"
	# puts 'multiplying ' + arrangement
	return lookup[arrangement] if lookup.key?(arrangement)

	# expensive operation
	# puts "current ops #{a[:row] * b[:col] * a[:col]}, previous a #{a[:operations]}, previous b #{b[:operations]}"
	operations = a[:row] * b[:col] * a[:col] + a[:operations] + b[:operations]
	lookup[arrangement] =
		{ matrices:	   [a, b],
			arrangement: arrangement,
			operations:  operations,
			row:         a[:row],
			col:				 b[:col] }

	lookup[arrangement]
end

results = mult({}, { matrices: [], arrangement: 'a', operations: 0, row: 10, col: 5}, 
				           { matrices: [], arrangement: 'b', operations: 0, row: 5, col: 1},
				           { matrices: [], arrangement: 'c', operations: 0, row: 1, col: 5},
				           { matrices: [], arrangement: 'd', operations: 0, row: 5, col: 10},
				           { matrices: [], arrangement: 'e', operations: 0, row: 10, col: 1})

puts 'min method is ' + results[:arrangement]
puts 'min cost is ' + results[:operations].to_s

