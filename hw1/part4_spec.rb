require './part4'

describe Dessert do
  let(:name) { 'my dessert' }

  context 'healthy dessert' do
    subject { Dessert.new(name, 199) }

    its(:name) { should == name }
    it { should be_healthy }
    it { should be_delicious }
  end

  context 'unhealthy dessert' do
    subject { Dessert.new(name, 201) }

    its(:name) { should == name }
    it { should_not be_healthy }
    it { should be_delicious }
  end
end

describe JellyBean do
  let(:name) { 'my dessert' }

  context 'healthy dessert' do
    subject { JellyBean.new(name, 199, 'grape') }

    its(:name) { should == name }
    it { should be_healthy }
    it { should be_delicious }
  end

  context 'unhealthy dessert' do
    subject { JellyBean.new(name, 201, 'grape') }

    its(:name) { should == name }
    it { should_not be_healthy }
    it { should be_delicious }
  end

  context 'unhealthy, non-delicious dessert' do
    subject { JellyBean.new(name, 201, 'black licorice') }

    its(:name) { should == name }
    it { should_not be_healthy }
    it { should_not be_delicious }
  end
end
