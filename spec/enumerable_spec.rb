require "./lib/enumerable"

RSpec.describe Enumerable do
  let(:array1) {[1, 2, 3, 4, 5]}
  let(:array2) {[6, 7, 8, 9, 10]}
  
  let(:hash1) {{a:1, b:2, c:3}}
  let(:hash2) {{a:"Hello", b:"Hey", c:"Goodbye"}}
  
  
  let(:proc1) { proc {|x| x>=10 }}
  let(:proc2) { proc {|x| x*3 }}
  let(:proc3) { proc {|res, val| res += val*3}}

  describe "#my_each" do
    it "return an array itself" do
      expect(array1.my_each{|x| x}).to eql(array1)
    end

    it "work with hash's keys" do
      keys = []
      hash2.my_each{|v, k| keys << k }
      expect(keys).to eql(hash2.keys)
    end
  
  end

  describe "#my_each_with_index" do
    it "return the array itself" do
      expect(array2.my_each_with_index{|x, index| x = x*2 }).to eql(array2)
    end

    it "return array's index" do
      index = []
      array2.my_each_with_index{|x, i| index << i}
      expect(index).to eql([0,1,2,3,4])
    end

    it "work with hash's keys" do
      keys = []
      hash1.my_each{|v, k| keys << k }
      expect(keys).to eql(hash1.keys)
    end

  end

  describe "#my_select" do
    it "return even number from an array" do
      expect(array2.my_select{|x| x % 2 == 0}).to eql([6, 8, 10])
    end

    it "return numbers bigger than 8" do
      expect(array2.my_select{|x| x > 8}).to eql([9, 10])
    end

    it "get empty array if empty block given" do
      expect(array1.my_select{}).to eql([])
    end

    it "return key equal to c value in a hash" do
      expect(hash1.my_select{|val, key| key == :c}).to eql([3])
    end
    
  end

  describe "#my_all?" do
    it "return true if they are all postive" do
      expect(array1.my_all?{|x| x > 0}).to be true
    end

    it "work with hase" do
      expect({a:"Hello", b:"Goodbye", c:"Sorry"}.my_all?{ |value, key| value.size >= 5}).to be true
    end

  end

  describe "#my_any?" do
    it "return false if one of them bigger than 5" do
      expect(array1.my_any?{|x| x>5}).to be false
    end

    it "return true if one of value size bigger than 4 in a hash" do
      expect(hash2.my_any?{|val, key| val.size > 4}).to be true
    end

    it "return true by using block" do
      expect(array2.my_any?(proc1)).to be true
    end

  end

  describe "#my_none?" do

    it "return true if none of them are smaller then zero" do
      expect(array1.my_none?{|x| x < 0}).to be true
    end

    it "return true if none of my hash value below 0" do
      expect(hash1.my_none?{|val, key| val < 0}).to be true
    end

    it "return true by using block" do
      expect(array1.my_none?(proc1)).to be true
    end

  end

  describe "#my_count" do
    it "return count if value equal to 6" do
      expect(array2.my_count(6)).to eql(1)
    end

    it "return count if condition fulfill" do
      expect(array2.my_count{|x| x>6}).to eql(4)
    end

    it "return count itself" do
      expect(hash1.my_count).to eql(3)
    end

  end

  describe "#my_map" do
    it "return double with numbers of array" do
      expect(array1.my_map{|x| x*2}).to eql([2,4,6,8,10])
    end

    it "return uppercase with string of hash" do
      expect(hash2.my_map{|val, key| val.upcase}).to eql(["HELLO", "HEY", "GOODBYE"])
    end

    it "return numers of array in 3 times by use proc" do
      expect(array1.my_map(proc2)).to eql([3,6,9,12,15])
    end
  end

  describe "#my_inject" do
    it "return sum of array" do
      expect(array1.my_inject{|result, val| result += val }).to eql(15)
    end

    it "return products of an array by use muptiply_els" do
      expect(muptiply_els(array1)).to eql(120)
    end

    it "return products of an array" do
      expect(array1.my_inject(1){|product, val| product * val}).to eql(120)
    end

    it "return sum of hash value with inital value of 10" do
      expect(hash1.my_inject(10){|sum, val, key| sum += val}).to eql(16)
    end

    it "return sum of array in 3 times by use proc" do
      expect(array1.my_inject(0,proc3)).to eql(45)
      expect(array2.my_inject(0,proc3)).to eql(120)
    end

  end


end

