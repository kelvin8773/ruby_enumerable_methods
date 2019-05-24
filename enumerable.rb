
module Enumerable
  def my_each
    for i in 0..self.size-1
      yield(self[i])
    end
    self  
  end

  def my_each_with_index
    for i in 0..self.size-1
      yield(self[i], i)
    end
    self  
  end

  def my_select
    res = []
    for i in 0..self.size-1
      if yield(self[i])
          res << self[i]
      end  
    end
    return res
  end

  def my_all?
    res = true
    for i in 0..self.size-1
      if !yield(self[i])
          res = false
      end  
    end
    return res
  end

  def my_any?
    res = false
    for i in 0..self.size-1
      if yield(self[i])
          res = true
      end  
    end
    return res
  end

  def my_none?
    res = true
    for i in 0..self.size-1
      if yield(self[i])
          res = false
      end  
    end
    return res
  end

  def my_count
    res = 0
    for i in 0..self.size-1
      if yield(self[i])
          res += 1
      end  
    end
    return res

  end

  def my_map
    res = []
    for i in 0..self.size-1
      res << yield(self[i])
    end
    return res
  end

  def my_inject

  end

end


[3, 4, 5].my_each {|x| p x }

hash = Hash.new
['cat', 'dog', 'wombat'].my_each_with_index { |item, index|
  hash[item] = index
}
p hash

p [1,2,3,4,5].my_select{ |num|  num.even? }   #=> [2, 4]

p %w[ant bear cat].my_all?{ |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_all?{ |word| word.length >= 4 } #=> false

p %w[ant bear cat].my_any?{ |word| word.length >= 3 } #=> true
p %w[ant bear cat].my_any?{ |word| word.length >= 4 } #=> true

%w{ant bear cat}.my_none?{ |word| word.length == 5 } #=> true
%w{ant bear cat}.my_none?{ |word| word.length >= 4 } #=> false

ary = [1, 2, 4, 2]
p ary.my_count{ |x| x%2==0 }                         #=> 3

p [1,2,3,4].my_map{ |i| i*i }                           #=> [1, 4, 9, 16]


# (5..10).inject { |sum, n| sum + n }            #=> 45
# (5..10).inject(1) { |product, n| product * n } #=> 151200
# # find the longest word
# longest = %w{ cat sheep bear }.inject do |memo, word|
#    memo.length > word.length ? memo : word
# end
# longest                                        #=> "sheep"
