
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
  end

  def my_all
  end

end


# [3, 4, 5].my_each {|x| puts x }

hash = Hash.new
%w(cat dog wombat).my_each_with_index { |item, index|
  hash[item] = index
}

p hash
