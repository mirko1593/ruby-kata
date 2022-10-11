class VowelFinder
  include Enumerable

  def initialize(string)
    @string = string
  end

  def each
    @string.scan(/[aeiou]/) do |vowel|
      yield vowel
    end
  end
end

vf = VowelFinder.new("the quick brown fox jumped")
vf.inject(:+)

module Sumable
  def sum
    inject(:+)
  end
end

class Array
  include Sumable
end

class Range
  include Sumable
end

class VowelFinder
  include Sumable
end
