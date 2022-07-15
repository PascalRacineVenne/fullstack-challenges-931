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

  def edit
    list
    index = @customers_view.ask_for(:index).to_i - 1
    customers = @customer_repository.all
    id = customers[index].id
    customer = @customer_repository.find(id)
    name = @customers_view.ask_for(:name)
    address = @customers_view.ask_for(:address)
    customer.name = name
    customer.address = address
  end

  def destroy
    list
    index = @customers_view.ask_for(:index).to_i - 1
    @customer_repository.remove(index)
  end


  private

  def display_all
    customers = @customer_repository.all
    @customers_view.display(customers)
  end
end

# As a user, I can edit an existing customer
# As a user, I can destroy an existing customer
