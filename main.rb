require_relative 'src/Library'

lib1 = Library.new

#seed data from Faker

lib1.seed
puts "Who often take the books?: #{lib1.top_reader}"
puts "The most popular book: #{lib1.top_book}"
puts "How many people ordered one of the three most popular books?: 
Top 1 book orders: #{lib1.count_of_orders_book(1)}
Top 2 book orders: #{lib1.count_of_orders_book(2)}
Top 3 book orders: #{lib1.count_of_orders_book(3)}"
lib1.save_to_file
lib2 = Library.new

#get data from file for another lib object

lib2.read_from_file

#puts "Who often take the books?: #{lib1.top_reader}"
#puts "The most popular book: #{lib1.top_book}"
#puts "How many people ordered one of the three most popular books?: 
#Top 1 book orders: #{lib2.count_of_orders_book(1)}
#Top 2 book orders: #{lib2.count_of_orders_book(2)}
#Top 3 book orders: #{lib2.count_of_orders_book(3)}"
