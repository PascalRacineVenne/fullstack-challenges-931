require_relative "../views/meals_view"
require_relative "../views/customers_view"
require_relative "../views/employees_view"
require_relative "../views/orders_view"
require_relative "../models/order"

class OrdersController
  def initialize(meal_repository, customer_repository, employee_repository, order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @employees_view = EmployeesView.new
    @orders_view = OrdersView.new
  end

  def add
    meal = select_a_meal
    customer = select_a_customer
    employee = select_an_employee
    order = Order.new(meal: meal, customer: customer, employee: employee)
    @order_repository.create(order)
  end

  def list_undelivered_orders
    undelivered_orders = @order_repository.undelivered_orders
    @orders_view.display(undelivered_orders)
  end

  def list_my_orders(employee)
    list_my_undelivered_orders(employee)
  end

  def mark_as_delivered(employee)
    list_my_undelivered_orders(employee)
    index = @orders_view.ask_for(:index).to_i - 1
    my_orders = @order_repository.my_undelivered_orders(employee)
    order = my_orders[index]
    @order_repository.mark_as_delivered(order)
  end

  private

  def select_a_meal
    meals = @meal_repository.all
    @meals_view.display(meals)
    index = @meals_view.ask_for(:index).to_i - 1
    return meals[index]
  end
  
  def select_a_customer
    customers = @customer_repository.all
    @customers_view.display(customers)
    index = @customers_view.ask_for(:index).to_i - 1
    return customers[index]
  end
  
  def select_an_employee
    employees = @employee_repository.all_riders
    @employees_view.display(employees)
    index = @employees_view.ask_for(:index).to_i - 1
    return employees[index]
  end

  def list_my_undelivered_orders(employee)
    orders = @order_repository.my_undelivered_orders(employee)
    @orders_view.display_undelivered(orders)
  end
end