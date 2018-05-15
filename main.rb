require_relative 'src/library'

lib_1 = Library.new

lib_1.seed
puts "Who often take the books?: #{lib_1.top_reader}"
puts "The most popular book: #{lib_1.top_book}"
puts "How many people ordered one of the three most popular books?: 
Top 1 book orders: #{lib_1.count_of_book_orders_in_position(1)}
Top 2 book orders: #{lib_1.count_of_book_orders_in_position(2)}
Top 3 book orders: #{lib_1.count_of_book_orders_in_position(3)}"
lib_1.save_to_file("ez.txt")
# lib_1.read_from_file