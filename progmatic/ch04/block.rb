class ProcExample
  def pass_in_block(&action)
    @stored_proc = action
  end

  def use_proc(parameter)
    @stored_proc.call(parameter)
  end
end

eg = ProcExample.new
eg.pass_in_block { |param| puts "the parameter is #{param}" }
eg.use_proc("hello world")

def n_times(thing)
  lambda { |n| n * thing }
end

p1 = n_times(23)
p1.call(2)
p1.call(3)

def my_if(condition, then_clause, else_clause)
  if condition
    then_clause.call
  else
    else_clause.call
  end
end

5.times do |val|
  my_if val < 2, -> { puts "#{val} is small" }, -> { puts "#{val} is big" }
end
