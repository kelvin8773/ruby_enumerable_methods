module Enumerable
  def my_each
    for i in 0..self.size-1
      yield(self[i])
    end
    self  
  end

  def my_each_with_index
    res = []
    for i in 0..self.size-1
      res << yield(self[i], i)
    end
    res
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
    elsif block_given?
      self.my_each { |x| res +=1 if yield(x) }
    else
      res = self.size
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

end

def muptiply_els(arr)
  arr.my_inject(1){|product, n| product * n}
end

# p [1, 2, 3].my_each{|x| x = 2} 

# p muptiply_els([2, 4, 5])            # => 40


