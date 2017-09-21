# Wikipedia about huffman coding is really good read
# I did not had time to fully read it.
# https://en.wikipedia.org/wiki/Huffman_coding
# This helped a lot 
# https://www.cs.duke.edu/csed/poop/huff/info/#gogoencode

# Tree (or Binary Tree) can be represented by nested array of 3 values

# https://en.wikipedia.org/wiki/Arithmetic_coding (to read)
def huffman_codes(text)
  w = Hash.new(0)
  text.each_char { |c| w[c] += 1 }
  tree = w.each_pair.map { |letter, weight| [weight, letter] }
  tree = get_tree(tree)
  print_code(tree)
end

def print_code(tree, code = '')
  if tree.length == 2 # its a node
    puts "#{tree[1]} #{code}"
  else
    left, right = tree[1], tree[2]
    print_code(left, code + '0')
    print_code(right, code + '1')
  end
end

def get_tree(tree)
  loop do 
    left, right, tree = get_min_2(tree)
    return left if right == nil
    w = left[0] + right[0]
    tree += [[w, left, right]] 
  end
end 

def get_min_2(tree)
  tree = tree.sort { |(k1,v1), (k2,v2)| k1 <=> k2 }
  left = tree.shift
  right = tree.shift
  [left, right, tree]
end

# huffman_codes('astala vista tasta')
huffman_codes('go go goffers')