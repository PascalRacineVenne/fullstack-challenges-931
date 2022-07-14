class View
  def ask_for(stuff)
    puts "Please enter a #{stuff}"
    gets.chomp
  end

  def display(recipes)
    recipes.each_with_index do |recipe, index|
      puts "#{index + 1} - #{recipe.name} :: #{recipe.description}"
    end
  end
end
