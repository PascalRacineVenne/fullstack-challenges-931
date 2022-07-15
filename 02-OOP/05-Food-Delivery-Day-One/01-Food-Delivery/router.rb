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
    puts "3 - List all customers"
    puts "4 - Add a customer"
    puts "0 - Quit program and Exit"
    print "> "
  end

  def trigger(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 3 then @customers_controller.list
    when 4 then @customers_controller.add
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
    puts "|  ♨(⋆‿⋆)♨  (◕‿◕✿)  |"
    puts "|_____AT PEDROS_____|"
    puts "|===================|"
    puts ""
  end
end
