require 'yaml'

module IOHelpers
  def write_to_file(file_name = 'output.yml')
    File.new("src/data/#{file_name}", 'w') unless File.exist?(file_name)
    File.open("src/data/#{file_name}", 'w') { |f| f.write(self.to_yaml) }
  end

  def read_from_file(file_name = 'input.yml')
    begin
      file = File.open("src/data/#{file_name}")
    rescue Errno::ENOENT => e
      puts "Exception: #{e}"
    end
    library = YAML.load_file(file)
    @authors = library.authors
    @books = library.books
    @orders = library.orders
    @readers = library.readers
  end
end
