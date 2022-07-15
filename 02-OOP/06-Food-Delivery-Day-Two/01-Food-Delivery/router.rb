class Router
  def initialize(meals_controller, customers_controller, sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end
  
  def run
    # [ ] As an employee, I can log in
    @employee = @sessions_controller.login
    while @running
      if @employee.manager?
        display_manager_menu
        manager_action = gets.chomp.to_i
        print `clear`
        trigger_manager(manager_action)
      elsif @employee.rider?
        display_rider_menu
        rider_action = gets.chomp.to_i
        print `clear`
        trigger_rider(rider_action)
      end
    end
  end

  private

  def display_manager_menu
    header
    display_manager_meals_action
    display_manager_customers_action
    puts "0 - Quit program and Exit"
    print "> "
  end
  
  # [X] As a manager, I can add a new meal
  # [X] As a manager, I can list all the meals
  # [X] As a manager, I can add a new customer
  # [X] As a manager, I can list all the customers
  # [ ] As a manager, I can add a new order
  # [ ] As a manager, I can list all the undelivered orders

  def display_manager_meals_action
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Change a meal"
    puts "4 - Delete a meal"
    puts ""
  end

  def display_manager_customers_action
    puts "5 - List all customers"
    puts "6 - Add a customer"
    puts "7 - Edit customer's info"
    puts "8 - Delete a customer"
    puts ""
  end

  def trigger_manager(action)
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

  def display_rider_menu
    header
    display_riders_action
    puts "0 - Quit program and Exit"
    print "> "
  end

  def display_riders_action
    puts "1 - List all undelivered orders"
    puts "2 - Mark as delivered"
    puts ""
  end

  def trigger_rider(action)
    case action
    # when 1 then @meals_controller.list
    # when 2 then @meals_controller.add
    # [ ] As a rider, I can mark one of my orders as delivered
    # [ ] As a rider, I list all my undelivered orders
 
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
