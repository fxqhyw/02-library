class Book
  attr_accessor :title, :author

  def initialize(title:, author:)
    @title = title
    @author = author
  end

  def to_h
    { title: self.title, author: self.author }
  end
end
