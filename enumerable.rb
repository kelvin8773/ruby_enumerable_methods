
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
    self.my_each { |x| res << x if yield(x) }
    res
  end

  def my_all?
    self.my_each { |x| return false if !yield(x) }
    true
  end
  
  def my_any?
    self.my_each { |x| return true if yield(x) }
    false 
  end
  
  def my_none?
    self.my_each { |x| return false if yield(x) }
    true
  end
  
  def my_count(value=nil)
    res = 0
    if value
      self.my_each { |x| res +=1 if x == value }
    else
      self.my_each { |x| res +=1 if yield(x) }
    end
    res
  end

  def my_map(proc=nil)
    result = []
    if proc
      self.my_each{|x| result << proc.call(x)}
    else 
      self.my_each{|x| result << yield(x)}
    end
    result  
  end

def my_inject(result=0)
  self.my_each{|x| result = yield(result, x) }
  result
end


#  Test case below ...  



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

ary = [1, 2, 4, 26]
p ary.my_count{ |x| x%2==0 }                         #=> 3

p [1,2,3,4].my_map{ |i| i*i }                        #=> [1, 4, 9, 16]

mlt = Proc.new{|x| x*x } 

p [1,2,3,4].my_map(&mlt)


p [5,6,7,8,9,10].my_inject{ |sum, n| sum + n }               #=> 45
p [5,6,7,8,9,10].my_inject(1){ |product, n| product * n }    #=> 151200

def muptiply_els(arr)
  arr.my_inject(1){|product, n| product * n}
end
p muptiply_els([2, 4, 5])            # => 40


