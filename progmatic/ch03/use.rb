require_relative "book_in_stock"

b1 = BookInStock.new('isbn1', 3)
puts b1.price
b1.price = b1.price * 0.75
puts b1.price
puts b1.price_in_cents
b1.price_in_cents = 3250
puts b1.price
