require_relative 'models/author'
require_relative 'models/book'
require_relative 'models/reader'
require_relative 'models/order'
require_relative 'io_helpers'
require 'ffaker'

class Library
  attr_accessor :authors, :books, :orders, :readers
  include IOHelpers

  def initialize(authors = [], books = [], orders = [], readers = [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

  def seed
    50.times do
      author = Author.new(name: FFaker::Book.author,
                          biography: FFaker::Lorem.paragraph(3))
      @authors << author
      @books << Book.new(title: FFaker::Book.unique.title, author: author)
    end

    60.times do
      @readers << Reader.new(name: FFaker::Name.unique.name,
                             email: FFaker::Internet.email,
                             city: FFaker::Address.city,
                             street: FFaker::Address.street_name,
                             house: FFaker::Address.building_number)
    end

    120.times do
      book_index = rand(@books.length - 1)
      reader_index = rand(@readers.length - 1)
      @orders << Order.new(book: @books[book_index], reader: @readers[reader_index])
    end
  end

  def top_reader
    @orders.group_by(&:reader).max_by { |_k, v| v.length }.first.name
  end

  def top_book
    @orders.group_by(&:book).max_by { |_k, v| v.length }.first.title
  end

  def count_of_book_orders_in_position(pos)
    grouped = @orders.group_by(&:book)
    grouped.each { |k, v| grouped[k] = v.length }.max_by(pos) { |_k, v| v }.dig(pos - 1, 1 )
  end
end
