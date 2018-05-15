class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_h
    { name: self.name, email: self.email, city: self.city, street: self.street, house: self.house }
  end
end
