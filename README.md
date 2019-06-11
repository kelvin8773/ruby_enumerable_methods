# Creat your own Ruby Enumerable methods (with Unit Test)

An Odin Project assignment aim to re-create your own enumerable method in Ruby.

In addition of another project by adding RSpec Unit Test the methods create.

## Note

* self-created Enumerable methods reside in `./lib/enumerable.rb`. 
* unit test for all the methods redide in `./spec/enumerable_spec.rb`.
* To use the methods, just `require ./lib/enumerable` in your code.
* Need to `gem install rsepc` to run the **unit test**, type `rspec` in the root folder to run.

```bash
➜  ruby_enumerable_methods git:(unit-test) ✗ rspec
............................

Finished in 0.01839 seconds (files took 0.11471 seconds to load)
28 examples, 0 failures
```

## Usages & examples

1. `my_each` method support both Array & Hash.
```ruby
res1 = 0
[1, 2, 3].my_each{|x| res1 += x * 2}
# => [1,2,3]
res1
# => 12

res2 = []
{a:1, b:2, c:3}.my_each{|val, key|, res2 << key}
# => {a:1, b:2, c:3}
res2
# => [:a, :b, :c]

```







