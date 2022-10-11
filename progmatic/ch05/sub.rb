class Parent
  def say_hello
    puts "Hello from #{self}"
  end
end

class Child < Parent
end

p = Parent.new
p.say_hello
c = Child.new
c.say_hello
