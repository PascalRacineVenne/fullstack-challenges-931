class Restaurant
  # TODO: add relevant accessors if necessary
  attr_reader :name, :city, :average_rating

  def initialize(city, name)
    @city = city
    @name = name
    @rates = []
    @average_rating = 0
  end

  def rate(new_rate)
    @rates << new_rate
    @average_rating = @rates.sum / @rates.length
  end

  def self.filter_by_city(restaurants, city)
    # p restaurants
    restaurants.filter { |restaurant| restaurant.city == city }
  end
  # TODO: implement .filter_by_city and #rate methods
end
