# companion matrix of a polynomial http://mathworld.wolfram.com/CompanionMatrix.html

# vieta's formulas relates the coefficients of the polynomials with to sums and 
# and products of its roots.

# eigen values
# http://mathworld.wolfram.com/Eigenvalue.html
# https://brilliant.org/wiki/vietas-formula/
# https://en.wikipedia.org/wiki/Companion_matrix
# https://en.wikipedia.org/wiki/Eigenvalues_and_eigenvectors
# http://setosa.io/ev/eigenvectors-and-eigenvalues/
# http://math.mit.edu/~gs/linearalgebra/ila0601.pdf

require 'matrix'

def roots(*coeffs)
  m = coeffs.reverse.each_with_index.inject([]) do |m, (v, k)|
    arr = Array.new(coeffs.length - 1, 0)
    # puts "m: #{m}, k: #{k}, v: #{v}"
    unless k == 0
      arr[k - 1] = 1
    end
    arr << -v
    # puts arr.join(',')
    m << arr
    m
  end

  Matrix[*m].eigensystem.eigenvalues
end

rt = roots(*ARGV[0].split(',').map(&:to_i))
# p r
