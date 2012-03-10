class Numeric
  @@currencies = {
    'yen' => 0.013,
    'euro' => 1.292,
    'rupee' => 0.019,
    'dollar' => 1
  }

  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub( /s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(convert_to)
    singular_currency = convert_to.to_s.gsub( /s$/, '')

    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    else
      raise 'Unknown currency'
    end
  end
end

class String
  def palindrome?
    normalized_string = self.downcase.gsub(/[^a-z]+/, '')
    normalized_string == normalized_string.reverse
  end
end

module Enumerable
  def palindrome?
    return false unless respond_to? :reverse
    self == self.reverse
  end
end
