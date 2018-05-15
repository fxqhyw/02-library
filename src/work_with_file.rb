module WorkWithFile
  def save_to_file(file_name = "data.txt")
    data = {}
    data[:authors] = @authors.map(&:to_h)
    data[:books] = @books.map(&:to_h)
    data[:readers] = @readers.map(&:to_h)
    data[:orders] = @orders.map do |order|
      {
        book: order.book.to_h,
        reader: order.reader.to_h
      }
    end
    File.open("src/data/#{file_name}", 'w') { |file| file.write(data) }
  end

  def read_from_file(file_name = "data.txt")
    unless File.exist?("src/data/#{file_name}.txt")
      raise "No #{file_name} file or directory"
    end
    got_data = eval(File.read("src/data/#{file_name}.txt"))
    got_data.each do |key, value|
      case key
      when :authors
        value.each { |a| @authors << Author.new(a[:name], a[:biography]) }
      when :books
        value.each { |b| @books << Book.new(b[:title], b[:author]) }
      when :readers
        value.each { |r| @readers << Reader.new(r[:name], r[:email], r[:city], r[:street], r[:house]) }
      when :orders
        value.each do |order|
          book = @books.detect { |b| b.title == order.dig(:book, :title) }
          reader = @readers.detect { |r| r.email == order.dig(:reader, :email) }
          date = Time.new(order[:date])
          @orders << Order.new(book, reader, date)
        end
      end
    end
  end
end
