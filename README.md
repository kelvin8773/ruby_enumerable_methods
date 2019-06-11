# Creat your own Ruby Enumerable methods (with Unit Test)

An Odin Project assignment aim to re-create your own enumerable method in Ruby.


## Note

* In addition of another project by adding RSpec Unit Test the methods create.

* self-created Enumerable methods reside in `./lib/enumerable.rb`. 
* unit test for all the methods redide in `./spec/enumerable_spec.rb`.

## Usages & examples

* To use the methods, just `require ./lib/enumerable` in your code.

1. `my_each` method support Array and Hash.
```ruby
res = 0
[1, 2, 3].my_each{|x| res += x * 2}
# => [1,2,3]
res
# => 12

keys = []
{a:1, b:2, c:3}.my_each{|val, key|, keys << key}
# => {a:1, b:2, c:3}
keys
# => [:a, :b, :c]

```

2. `my_each_with_index` method same as `my_each` by just adding support for index for Array.
```ruby
index = []
[a, b, c].my_each_with_index{|val, i| index << i}
# => [a, b, c]
index
# => [0, 1, 2]
``` 

3. `my_select` method base on `my_each` add conditional filtering.

```ruby
[1, 2, 3, 4].my_select{|x| x>2}
# => [3, 4]
{a:4, b:5, c:6}.my_select{|val, key| val % 2 == 0}
# => {a:4, c:6}
```

4. `my_all?` method base on `my_each` return `true` or `false` base on conditions given for all. (`proc` supported)
```ruby
[1,2,3].my_all?{|x| x > 2}
# => false

{a:"Hello", b:"Goodbye", c:"Sorry"}.my_all?{ |value, key| value.size >= 5}
# => true

my_proc = Proc.new({|x| x>0})
[3,4,5,6].my_all?(my_proc)
# => true

```

5. `my_any?` method base on `my_each` return `true` or `false` base on condition given for any of one element. (`proc` supported)
```ruby
[1,2,3].my_any?{|x| x > 2}
# => true

{a:"Hello", b:"Goodbye", c:"Sorry"}.my_any?{ |value, key| value.size == 5}
# => true

my_proc = Proc.new({|x| x>5})
[3,4,5,6].my_any?(my_proc)
# => true
```

6. `my_none?` method just the opposite of `my_all?`.(`proc` supported)

```ruby

[1,2,3].my_none?{|x| x > 3}
# => true

{a:"Hello", b:"Goodbye", c:"Sorry"}.my_none?{ |value, key| value.size == 7}
# => false

my_proc = Proc.new({|x| x<0})
[3,4,5,6].my_none?(my_proc)
# => true

```

7. `my_count` method provide 3 ways to count, count-self, count-if, count-equal. 

```ruby
#count-self (size of itself)
[1,2,3,5,8].my_count
# => 5

# count-if (count if value > 5)
{a:3, b:6, c:7, d:5}.my_count{|val, key| val > 5}
# => 2

#count-equal (count only value == 3)
[3,4,8,3,7,2,4].my_count(3)
# => 3

```


8. `my_map` method base on `my_each` return result base on given block operations. 

```ruby
[1,2,3,4,5].my_map{|x| x*2}
# => [2,4,6,8,10]

{a:"Hello", b:"Hey", c:"Goodbye"}.my_map{|val, key| val.upcase}
# => {a:"HELLO", b:"HEY", c:"GOODBYE"}

my_proc = Proc.new({|x| x*3 })
[1,2,3,4].my_map(my_proc)
# => [3,6,9,12]
```

9. `my_inject` method similar `reduce` method in ruby standard libary, adding support on hash, proc.

```ruby
[1,2,3,4,5].my_inject{|result, val| result += val }
# => 15

[1,2,3,4].my_inject(1){|product, val| product * val}
# => 24

{a:1, b:2, c:3}.my_inject(10){|sum, val, key| sum += val}
# => 6

my_proc = Proc.new({|res, val| res += val*3})
[1,2,3,4,5].my_inject(0,proc3)
# => 45
```


## Unit-Tests


* Need to `gem install rsepc` to run the **unit test**, type `rspec` in the root folder to run.

Result should be sth like below: 

```bash
➜  ruby_enumerable_methods git:(development) rspec
.............................

Finished in 0.01882 seconds (files took 0.09676 seconds to load)
29 examples, 0 failures
```

## reference links

* [The Ultimate Guide to Blocks, Procs & Lambdas](https://www.rubyguides.com/2016/02/ruby-procs-and-lambdas/)

* [RSpec Unit Test from Odin Project](https://www.theodinproject.com/courses/ruby-programming/lessons/introduction-to-rspec)

* [RSpec Beginners Guide](http://testing-for-beginners.rubymonstas.org/rspec.html)








