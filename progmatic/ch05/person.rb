class Person
  include Comparable
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def to_s
    "#{@name}"
  end

  def <=>(other)
    self.name <=> other.name
  end
end

p1 = Person.new("Marz")
p2 = Person.new("Guido")
p3 = Person.new("Larry")

puts [p1, p2, p3].sort
