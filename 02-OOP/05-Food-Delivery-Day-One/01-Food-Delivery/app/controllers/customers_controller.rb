require_relative "../views/customers_view"
require_relative "../models/customer"

class CustomersController
  def initialize(customer_repository)
    @customer_repository = customer_repository
    @customers_view = CustomersView.new
  end

  def list
    display_all
  end

  def add
    name = @customers_view.ask_for(:name)
    address = @customers_view.ask_for(:address)
    customer = Customer.new(name: name, address: address)
    @customer_repository.create(customer)
  end

  private

  def display_all
    customers = @customer_repository.all
    @customers_view.display(customers)
  end
end
