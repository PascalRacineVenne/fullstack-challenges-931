require_relative '../views/employees_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @employees_view = EmployeesView.new
  end

  def login
    username = @employees_view.ask_for(:username)
    password = @employees_view.ask_for(:password)
    employee = @employee_repository.find_by_username(username)

    if employee && employee.password == password
      return employee

    else
      login
    end
  end
end