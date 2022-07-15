class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      display_menu
      action = gets.chomp.to_i
      print `clear`
      trigger(action)
    end
  end

  private

  def display_menu
    header
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Change a meal"
    puts "4 - Delete a meal"
    puts ""
    puts "5 - List all customers"
    puts "6 - Add a customer"
    puts "7 - Edit customer's info"
    puts "8 - Delete a customer"
    puts ""
    puts "0 - Quit program and Exit"
    print "> "
  end

  def trigger(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @meals_controller.edit
    when 4 then @meals_controller.destroy
    when 5 then @customers_controller.list
    when 6 then @customers_controller.add
    when 7 then @customers_controller.edit
    when 8 then @customers_controller.destroy
    when 0 then stop!
    else puts "Wrong input... Try again"
    end
  end

  def stop!
    @running = false
  end

  def header
    puts ""
    puts "|===================|"
    puts "|                   |"
    puts "|  ♨(⋆‿⋆)♨  (◕‿◕✿)  |"
    puts "|____ AT PEDROS ____|"
    puts "|                   |"
    puts "|===================|"
    puts ""
  end
end
