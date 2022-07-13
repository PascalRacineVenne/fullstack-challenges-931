require_relative 'restaurant'

p jules_verne = Restaurant.new("paris", "Jules Verne")
jules_verne.rate(5)
p jules_verne
jules_verne.rate(0)
p jules_verne
bluebird = Restaurant.new("london", "Bluebird")
daniel = Restaurant.new("new york", "Daniel")
restaurants = [jules_verne, bluebird, daniel]
Restaurant.filter_by_city(restaurants, "london")
# => [ #<Restaurant:0x007f9a43bb7eb8 @city="london", @name="Bluebird"> ]
