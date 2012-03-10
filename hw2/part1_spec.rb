require './part1'

describe Numeric do
  context 'dollars' do
    it 'should convert to euros' do
      5.dollars.in(:euros).should be_within(0.1).of(3.87)
    end

    it 'should convert to rupees' do
      1.dollar.in(:rupees).should be_within(0.1).of(52.6)
    end

    it 'should convert to yen' do
      5.dollars.in(:yen).should be_within(0.1).of(384.6)
    end

    it 'should convert to dollars' do
      5.dollars.in(:dollars).should == 5
    end
  end

  context 'yen' do
    it 'should convert to euros' do
      5000.yen.in(:euro).should be_within(0.1).of(50.31)
    end

    it 'should convert to rupees' do
      5000.yen.in(:rupees).should be_within(0.1).of(3421.0)
    end

    it 'should convert to yen' do
      5000.yen.in(:yen).should == 5000
    end

    it 'should convert to dollars' do
      5000.yen.in(:dollars).should be_within(0.1).of(65.0)
    end
  end
end

describe String do
  context 'palindrome' do
    subject { "A man, a plan, a canal -- Panama" }
    it { should be_a_palindrome }
  end

  context 'non-palindrome' do
    subject { "Abracadabra" }
    it { should_not be_a_palindrome }
  end
end

describe 'Enumerable palindromes' do
  context 'array palindrome' do
    subject { [1,2,3,2,1] }
    it { should be_a_palindrome }
  end

  context 'array palindrome' do
    subject { [1,2,3,2,2] }
    it { should_not be_a_palindrome }
  end

  context 'hash' do
    subject { {a: 1, b: 2} }
    it { should_not be_a_palindrome }
  end
end
