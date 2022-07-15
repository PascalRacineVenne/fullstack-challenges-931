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

  def edit
    list
    index = @meals_view.ask_for(:index).to_i - 1
    meal = @meals[index]
    meal.name = @meals_view.ask_for(:name)
    meal.price = @meals_view.ask_for(:price).to_i
    @meal_repository.update(meal, index)
  end

  def destroy
    list
    index = @meals_view.ask_for(:index).to_i - 1
    @meal_repository.remove(index)
  end

  private

  def display_meals
    @meals = @meal_repository.all
    @meals_view.display(@meals)
  end
end

# As a user, I can edit an existing meal
# As a user, I can destroy an existing meal
