require 'csv'
require_relative "../models/customer"

class CustomerRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def all
    @elements
  end

  def create(customer)
    customer.id = @next_id
    @elements << customer
    @next_id += 1
    save_csv
  end

  def find(id)
    @elements.find { |customer| customer.id == id }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Customer.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %w[id name address]
      @elements.each do |element|
        csv << [element.id, element.name, element.address]
      end
    end
  end
end
