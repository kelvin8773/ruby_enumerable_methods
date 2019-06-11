module Enumerable
  def my_each
    if self.is_a? Array
      for i in 0..self.size-1
        yield(self[i])
      end
    elsif self.is_a? Hash
      for key in self.keys
        yield(self[key], key)
      end
    end
    self  
  end

  def my_each_with_index
    if self.is_a? Array
      for i in 0..self.size-1
        yield(self[i],i)
      end
    elsif self.is_a? Hash
      for key in self.keys
        yield(self[key],key)
      end
    end
    self
  end

  def my_select
      res = []
      self.my_each { |val, key| res << val if yield(val, key) }
      res
  end

  def my_all?
      self.my_each { |val, key| return false if !yield(val, key) }
      true
  end
  
  def my_any?(proc=nil)
    if proc
      self.my_each {|val, key| return true if proc.call(val, key)}
    elsif block_given?
      self.my_each { |val, key| return true if yield(val, key) }
    end
    false 
  end
  
  def my_none?(proc=nil)
    if proc
      self.my_each{|val, key| return false if proc.call(val, key)}
    elsif block_given?
      self.my_each { |val, key| return false if yield(val, key)}
    end  
      true
  end
  
  def my_count(test_value=nil)
    res = 0
    if test_value
      self.my_each { |val, key| res +=1 if val == test_value  }
    elsif block_given?
      self.my_each { |val, key| res +=1 if yield(val) }
    else
      res = self.size
    end  
    res
  end


  def my_map(proc=nil)
    result = []
    if proc
      self.my_each{|val, key| result << proc.call(val, key)}
    elsif block_given? 
      self.my_each{|val, key| result << yield(val, key)}
    end
    result  
  end

  def my_inject(result=0, proc=nil)
    if proc
      self.my_each{|val,key| result = proc.call(result,val, key)}
    elsif block_given?
      self.my_each{|val, key| result = yield(result, val, key) }
    end
    result
  end

end

def muptiply_els(arr)
  arr.my_inject(1){|product, n| product * n}
end

# p muptiply_els([2, 4, 5])            # => 40


