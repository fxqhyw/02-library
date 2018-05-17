class Author
  attr_accessor :name, :biography

  def initialize(name:, biography:)
    @name = name
    @biography = biography
  end

  def to_h
    { name: self.name, biography: self.biography }
  end
end
