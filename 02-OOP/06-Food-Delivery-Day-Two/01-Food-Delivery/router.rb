class Router
  def initialize(meals_controller, customers_controller, sessions_controller, orders_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @orders_controller = orders_controller
    @running = true
  end

  def run
    while @running
      @employee = @sessions_controller.login
      while @employee
        if @employee.manager?
          route_manager_action
        else
          route_rider_action
        end
      end
    end
  end

  private

  def route_manager_action
    display_manager_menu
    manager_action = gets.chomp.to_i
    print `clear`
    trigger_manager(manager_action)
  end

  def display_manager_menu
    header
    display_manager_meals_action
    display_manager_customers_action
    display_manager_orders_action
    puts "0 - Quit program and Exit"
    puts "11 - LOGOUT"
    print "> "
  end

  def display_manager_meals_action
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "3 - Change a meal"
    puts "4 - Delete a meal"
  end

  def display_manager_customers_action
    puts "5 - List all customers"
    puts "6 - Add a customer"
    puts "7 - Edit customer's info"
    puts "8 - Delete a customer"
  end

  def display_manager_orders_action
    puts "9 - Add a new order"
    puts "10 - List all undelivered orders"
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
    when 9 then @orders_controller.add
    when 10 then @orders_controller.list_undelivered_orders
    when 11 then logout!
    when 0 then stop!
    else puts "Wrong input... Try again"
    end
  end

  def route_rider_action
    display_rider_menu
    rider_action = gets.chomp.to_i
    print `clear`
    trigger_rider(rider_action)
  end

  def display_rider_menu
    header
    puts "1 - List all undelivered orders"
    puts "2 - Mark as delivered"
    puts "0 - Quit program and Exit"
    puts "11 - LOG OUT"
    print "> "
  end

  def trigger_rider(action)
    case action
    when 1 then @orders_controller.list_my_orders(@employee)
    when 2 then @orders_controller.mark_as_delivered(@employee)
    when 11 then logout!
    when 0 then stop!
    else puts "Wrong input... Try again"
    end
  end

  def logout!
    @employee = nil
  end

  def stop!
    logout!
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
