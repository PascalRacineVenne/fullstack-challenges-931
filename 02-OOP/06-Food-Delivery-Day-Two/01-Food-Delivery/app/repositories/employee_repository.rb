require 'csv'
require_relative "../models/employee"
require_relative '../repositories/base_repository'

class EmployeeRepository < BaseRepository
  undef_method :create

  def all_riders
    @elements.select { |element| element.role == "rider" }
  end

  def find_by_username(username)
    @elements.find { |element| element.username == username }
  end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      @elements << Employee.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << %(id username password role)
      @elements.each do |element|
        csv << [element.id, element.username, element.password, element.role]
      end
    end
  end
end
