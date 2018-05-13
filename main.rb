require_relative 'src/Library'

lib1 = Library.new
#seed data from Faker
lib1.seed
puts "Who often take the books?: #{lib1.who_often_take_books}"
puts "The most popular book: #{lib1.most_popular_books}"
puts "How many people ordered one of the three most popular books?: 
  #{lib1.count_of_orders_three_most_popular_books}"
lib1.save_to_file
lib2 = Library.new
#get data from file
lib2.read_from_file