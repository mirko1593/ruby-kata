def two_times
  yield
  yield
end

# two_times { puts "hello" }

def fib_up_to(max)
  i1, i2 = 1, 1
  while i1 < max
    yield i1
    i1, i2 = i2, i1 + i2
  end
end

# fib_up_to(1000) { |f| print f, " " }

# [1, 2, 3, 4, 5].each { |i| puts i }

class Array
  def find
    each do |value|
      return value if yield(value)
    end
    nil
  end
end

# [1, 3, 5, 7, 9].find { |val| val * val > 30 }

# ["H", "A", "L"].collect { |x| x.succ }
result = []
"cat".each_char.with_index { |item, index| result << [item, index] }
result

triangular_numbers = Enumerator.new do |yielder|
  number = 0
  count = 1
  loop do
    number += count
    count += 1
    yielder.yield number
  end
end

5.times { print triangular_numbers.next, " " }

def infinite_select(enum, &block)
  Enumerator.new do |yielder|
    enum.each do |value|
      yielder.yield(value) if block.call(value)
    end
  end
end

infinite_select(triangular_numbers) { |val| val % 10 == 0 }.first(5)

class Enumerator
  def infinite_select(&block)
    Enumerator.new do |yielder|
      self.each do |value|
        yielder.yield(value) if block.call(value)
      end
    end
  end
end

triangular_numbers.infinite_select { |val| val % 10 == 0 }.infinite_select { |val| val.to_s =~ /3/ }.first(5)

def Integer.all
  Enumerator.new do |yielder, n: 0|
    loop { yielder.yield(n += 1) }
  end.lazy
end

Integer.all.first(10)

Integer.all.select { |i| (i % 3).zero? }.first(10)

def palindrome?(n)
  n = n.to_s
  n == n.reverse
end

Integer.all.select { |i| i % 3 == 0 }.select { |i| palindrome?(i) }.first(10)

multiple_of_three = ->n { (n % 3).zero? }
palindrome = ->n { n = n.to_s; n == n.reverse }
Integer.all.select(&multiple_of_three).select(&palindrome).first(10)
