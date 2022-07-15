# TODO: implement the router of your app.
class Router
  def initialize(meals_controller)
    @meals_controller = meals_controller
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
    puts "1 - List all meals"
    puts "2 - Add a meal"
    puts "0 - Quit program and Exit"
    print "> "
  end

  def trigger(action)
    case action
    when 1 then @meals_controller.list
    when 2 then @meals_controller.add
    when 0 then stop!
    else puts "Wrong input... Try again"
    end
  end

  def stop!
    @running = false
  end
end
