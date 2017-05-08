# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name, :reviews
  @@all = []

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
    @reviews = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|customer| customer.full_name == name}
  end

  def self.find_all_by_first_name(name)
    self.all.map {|customer| customer.first_name == name}
  end

  def self.all_names
    self.all.map {|customer| customer.full_name}
  end

  def add_review(restaurant, content)
    review = Review.new(self, restaurant, content)
    self.reviews << review
    restaurant.reviews << review
  end
end

class Restaurant
  attr_accessor :name
  attr_reader :reviews
  @@all = []

  def initialize(name)
    @name = name
    @@all << self
    @reviews = []
  end

  def self.all
    @@all
  end

  def self.find_by_name(name)
    self.all.detect {|restaurant| restaurant.name == name}
  end

  def reviews
    self.reviews
  end

  def customers
    self.reviews.map {|review| review.customer}
  end

end

class Review
  attr_accessor :customer, :restaurant, :content
  @@all = []

  def initialize(customer, restaurant, content)
    @customer = customer
    @restaurant = restaurant
    @content = content
    @@all << self
  end

  def self.all
    @@all
  end

  def customer
    self.customer
  end

  def restaurant
    self.restaurant
  end

end
