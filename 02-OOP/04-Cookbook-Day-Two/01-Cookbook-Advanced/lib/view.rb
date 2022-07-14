class View
  def ask_for(stuff)
    puts "Please enter a #{stuff}"
    gets.chomp
  end

  def ask_for_internet(index)
    puts "Which recipe would you like to import? (enter index)"
    print "> "
    gets.chomp.to_i - 1
  end

  def importing(recipe)
    puts "Display Importing #{recipe[:title]}..."
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      done = recipe.done? ? "[x]" : "[ ]" 
      puts "#{index + 1} #{done} - #{recipe.name}"
      puts ":: #{recipe.description}"
      puts ":: Rate :#{recipe.rating} :: Preperation time: #{recipe.prep_time}"
      puts ""
    end
  end

  def ask_for_index(index)
    puts "Please choose an index"
    print "> "
    gets.chomp.to_i - 1
  end

  def search_for(ingredient)
    puts "What ingredient would you like a recipe for?"
    print "> "
    ingredient = gets.chomp
    puts "Looking for #{ingredient} recipes on the Internet..."
    return ingredient
  end
end
