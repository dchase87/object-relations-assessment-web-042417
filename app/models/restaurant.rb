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
