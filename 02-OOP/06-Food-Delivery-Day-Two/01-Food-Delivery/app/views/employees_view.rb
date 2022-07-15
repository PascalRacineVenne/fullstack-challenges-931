class EmployeesView
  def ask_for(stuff)
    puts "Please enter your #{stuff}"
    print "> "
    gets.chomp
  end

  def display(employees)
    employees.each_eith_index do |employee|
      puts "#{index + 1}. #{employee.username} :: #{employee.role}"
    end
  end
end