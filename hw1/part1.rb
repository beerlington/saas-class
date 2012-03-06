def palindrome?(string)
  normalized_string = string.downcase.gsub(/[^a-z]+/, '')
  normalized_string == normalized_string.reverse
end

def count_words(string)
  string.downcase.scan(/[a-z]+/).inject({}) {|h,v| h[v] ||= 0; h[v] += 1; h}
end
