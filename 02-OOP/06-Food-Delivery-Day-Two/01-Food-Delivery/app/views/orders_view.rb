class OrdersView
  def display(orders)
    orders.each_with_index do |order, index|
      status = order.delivered? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{order.customer.name} :: #{order.meal.name} :: #{order.employee.username}"
    end
  end

  def display_undelivered(orders)
    orders.each_with_index do |order, index|
      status = order.delivered? ? "[X]" : "[ ]"
      puts "#{index + 1}. #{status} #{order.meal.name} :: FOR #{order.customer.name}"
    end
  end

  def ask_for(stuff)
    puts "Please select an #{stuff}"
    print "> "
    gets.chomp
  end
end
