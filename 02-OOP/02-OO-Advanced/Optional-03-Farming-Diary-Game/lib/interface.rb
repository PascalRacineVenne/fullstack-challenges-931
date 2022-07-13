# DO NOT remove the line below, written for display purpose
require_relative "../spec/helper/board"

require_relative "rice"
require_relative "corn"
require_relative "cow"
require_relative "chicken"

# Display the state of the farm (move the line below in the loop when asked)

choice = nil
crops = []
animals = []

while choice != 'quit'
  puts "Pick an action: [corn | rice | water | cow | chicken | feed | quit]"
  print "> "
  choice = gets.chomp.downcase

  case choice
  when "corn"
    puts "Let's plant corn crops!"
    crops << Corn.new
  when "rice"
    puts "Rice crops today!"
    crops << Rice.new
  when "water"
    puts "Adding water to the crops"
    crops.each { |crop| crop.water! }
  when "cow"
    puts "You both a new cow!"
    animals << Cow.new
  when "chicken"
    puts "You both a new chicken!"
    puts "Is it a male or a female"
    print "> "
    gender = gets.chomp.downcase
    animals << Chicken.new(gender)
  when "feed"
    puts "Feeding the animals"
    animals.each { |animal| animal.feed! }
  when "quit"
    puts "See you next time"
  else
    puts "I don't know what you mean..."
  end
  Board.new.display
end
