require './part5'

describe Foo do
  let(:foo1) { Foo.new }
  let(:foo2) { Foo.new }

  before do
    foo1.bar = 3
    foo1.bar = :wowzo
    foo1.bar = 'boo!'

    foo2.bar = 4
    foo2.bar = 'hi'
  end

  it 'should retain attr_reader functionality' do
    foo1.bar.should == 'boo!'
  end

  it 'should retain attr_reader functionality' do
    foo2.bar.should == 'hi'
  end

  it 'should keep the history for foo1' do
    foo1.bar_history.should == [nil, 3, :wowzo, 'boo!']
  end

  it 'should keep the history for foo2' do
    foo2.bar_history.should == [nil, 4, 'hi']
  end
end
