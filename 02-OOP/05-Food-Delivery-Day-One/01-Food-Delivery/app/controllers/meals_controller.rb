require_relative "../models/meal"
require_relative "../views/meals_view"

class MealsController
  def initialize(meal_repository)
    @meal_repository = meal_repository
    @meals_view = MealsView.new
  end

  def list
    display_meals
  end

  def add
    name = @meals_view.ask_for(:name)
    price = @meals_view.ask_for(:price).to_i
    meal = Meal.new(name: name, price: price)
    @meal_repository.create(meal)
  end

  private

  def display_meals
    meals = @meal_repository.all
    @meals_view.display(meals)
  end
end
