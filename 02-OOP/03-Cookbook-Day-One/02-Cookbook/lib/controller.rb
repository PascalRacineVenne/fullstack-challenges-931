require_relative 'view'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    recipes = @cookbook.all
    @view.display(recipes)
  end

  def create
    name = @view.ask_for(:name)
    description = @view.ask_for(:description)
    new_recipe = Recipe.new(name, description)
    @cookbook.add_recipe(new_recipe)
  end

  def destroy
    list
    index = @view.ask_for(:index).to_i
    @cookbook.remove_recipe(index - 1)
  end
end
