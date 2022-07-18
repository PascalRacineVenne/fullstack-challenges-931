class EmployeesView
  def ask_for(stuff)
    puts "Please enter your #{stuff}"
    print "> "
    gets.chomp
  end

  def display(employees)
    employees.each_with_index do |employee, index|
      puts "#{index + 1}. #{employee.username} :: #{employee.role}"
    end
  end
end