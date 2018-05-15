require_relative 'models/author'
require_relative 'models/book'
require_relative 'models/reader'
require_relative 'models/order'
require_relative 'work_with_file'
require 'ffaker'

class Library
  attr_accessor :authors, :books, :orders, :readers
  include WorkWithFile

  def initialize(authors = [], books = [], orders = [], readers = [])
    @authors = authors
    @books = books
    @orders = orders
    @readers = readers
  end

  def seed
    40.times do
      author = Author.new(name: FFaker::Book.author,
                          biography: FFaker::Lorem.paragraph(3))
      @authors << author
      @books << Book.new(title: FFaker::Book.unique.title, author: author)
    end

    100.times do
      @readers << Reader.new(name: FFaker::Name.unique.name,
                             email: FFaker::Internet.email,
                             city: FFaker::Address.city,
                             street: FFaker::Address.street_name,
                             house: FFaker::Address.building_number)
    end

    100.times do
      book_id = rand(@books.length - 1)
      reader_id = rand(@readers.length - 1)
      @orders << Order.new(book: @books[book_id], reader: @readers[reader_id])
    end
  end

  def top_reader
    count = @orders.each_with_object({}) do |order, h|
      h[order.reader.name] = 0 unless h.key? order.reader.name
      h[order.reader.name] += 1
    end
    count.max_by { |_k, v| v }.first
  end

  def top_book
    count = @orders.each_with_object({}) do |order, h|
      h[order.book.title] = 0 unless h.key? order.book.title
      h[order.book.title] += 1
    end
    count.max_by { |_k, v| v }.first
  end

  def count_of_book_orders_in_position(position)
    count = @orders.each_with_object({}) do |order, h|
      h[order.book.title] = 0 unless h.key? order.book.title
      h[order.book.title] += 1
    end
    top = count.max_by(position) { |_k, v| v }
    top.dig(position - 1, 1)
  end
end
