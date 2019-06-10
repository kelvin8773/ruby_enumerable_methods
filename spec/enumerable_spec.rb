require "./lib/enumerable"

RSpec.describe Enumerable do
  let(:array1) {[1, 2, 3, 4, 5]}
  let(:array2) {[6, 7, 8, 9, 10]}

  let(:hash1) {{a:1, b:2, c:3}}
  let(:block1) { proc {|x| x*x }} 

  describe "#my_each" do
    it "return an array itself" do
      expect(array1.my_each{|x| x}).to eql(array1)
    end

    it "return an hash itself" do
      expect(hash1.my_each{|k, v| k}).to eql(hash1)
    end

    it "take block return array itself" do
      expect(array1.my_each{block1}).to eql(array1)
    end
  end

  describe "#my_each_with_index" do
    it "return index of an array" do
      expect(array2.my_each_with_index{|x, index| index}).to eql([0,1,2,3,4])
    end

    it "return an array itself" do
      expect(array2.my_each_with_index{|x, index| x}).to eql(array2)
    end

  end

  describe "#my_select" do
    it "return odd number from an array"
      expect(array2.my_select{|x| x % 2 == 0}).to eql([6, 8, 10])
    end
  end


end

