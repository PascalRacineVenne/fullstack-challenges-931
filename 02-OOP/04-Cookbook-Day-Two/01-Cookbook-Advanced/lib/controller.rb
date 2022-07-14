require_relative 'search'
require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display
  end

  def create
    name = @view.ask_for(:name)
    description = @view.ask_for(:description)
    rating = @view.ask_for(:rating)
    prep_time = @view.ask_for(:prep_time)
    new_recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(new_recipe)
  end

  def search
    ingredient = @view.search_for(:ingredient)
    results = Search.new(ingredient).scrape
    @view.display(results)
    index = @view.ask_for_internet(:index)
    @cookbook.add_recipe(results[index])
  end

  def mark_as_done
    list
    index = @view.ask_for_index(:index)
    @cookbook.mark_as_done!(index)
  end

  def destroy
    list
    index = @view.ask_for(:index).to_i
    @cookbook.remove_recipe(index - 1)
  end

  private

  def display
    recipes = @cookbook.all
    @view.display(recipes)
  end
end
