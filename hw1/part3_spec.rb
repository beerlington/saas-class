require './part3'

describe 'combining anagrams' do
  let(:words) do
    ['cars', 'for', 'Potatoes', 'racs', 'four','scar', 'creams', 'scream']
  end

  it 'should combine them' do
    combine_anagrams(words).sort.should == [["cars", "racs", "scar"], ["four"], ["for"], ["Potatoes"], ["creams", "scream"]].sort
  end
end
