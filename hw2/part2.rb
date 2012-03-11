class CartesianProduct
  include Enumerable

  attr_reader :elements

  def initialize(collection1, collection2)
    @elements = []

    collection1.each do |e1|
      collection2.each do |e2|
        self.elements << [e1, e2]
      end
    end
  end

  def each
    elements.each { |e| yield e }
  end
end
