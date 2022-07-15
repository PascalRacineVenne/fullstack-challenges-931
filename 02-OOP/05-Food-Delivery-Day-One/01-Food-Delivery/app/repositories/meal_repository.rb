require 'csv'
require_relative '../models/meal'
require_relative '../repositories/base_repository'

class MealRepository < BaseRepository
  # def initialize(csv_file)
  #   @csv_file = csv_file
  #   @elements = []
  #   @next_id = 1
  #   load_csv if File.exist?(@csv_file)
  # end

  # def create(element)
  #   element.id = @next_id
  #   @elements << element
  #   @next_id += 1
  #   save_csv
  # end

  # def all
  #   @elements
  # end

  # def find(id)
  #   @elements.find { |element| element.id == id }
  # end

  # def remove(index)
  #   @elements.delete_at(index)
  #   save_csv
  # end

  private

  def load_csv
    CSV.foreach(@csv_file, headers: :first_row, header_converters: :symbol) do |row|
      row[:id] = row[:id].to_i
      row[:price] = row[:price].to_i
      @elements << Meal.new(row)
    end
    @next_id = @elements.last.id + 1 unless @elements.empty?
  end

  def save_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << ['id', 'name', 'price']
      @elements.each do |element|
        csv << [element.id, element.name, element.price]
      end
    end
  end
end
