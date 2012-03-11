require './part2'

describe CartesianProduct do
  context 'two collections' do
    subject { CartesianProduct.new([:a,:b], [4,5]) }

    it { should have(4).elements }
    its(:to_a) { should == [[:a, 4], [:a, 5], [:b, 4], [:b, 5]] }
  end

  context 'two collections 2nd example' do
    subject { CartesianProduct.new([:a,:b,:c], [4,5]) }

    it { should have(6).elements }
    its(:to_a) { should == [[:a,4],[:a,5],[:b,4],[:b,5],[:c,4],[:c,5]] }
  end

  context 'empty collection' do
    subject { CartesianProduct.new([:a,:b], []) }
    its(:to_a) { should == [] }
  end
end
