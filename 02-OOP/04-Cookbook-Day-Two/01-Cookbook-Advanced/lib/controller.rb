require 'open-uri'
require 'nokogiri'
require_relative 'view'

class Controller
  BASE_URL = "https://www.allrecipes.com/search/results/?search="

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
    rating = @view.ask_for(:rating)
    prep_time = @view.ask_for(:prep_time)
    new_recipe = Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    @cookbook.add_recipe(new_recipe)
    list
  end

  def search
    ingredient = @view.search_for(:ingredient)
    query = "#{BASE_URL}#{ingredient}"
    html_doc = URI.open(query).read
    xml_doc = Nokogiri::HTML(html_doc)

    results = []

    xml_doc.search(".card__recipe").first(5).each do |element|
      name = element.search(".card__imageContainer a").first.attribute("title").value.strip
      description = element.search(".card__detailsContainer .card__summary").first.text.strip
      rating_element = element.search(".card__detailsContainer .review-star-text").first
      rating = rating_element ? rating_element.text.strip.match(/\d\.?\d*/)[0] : nil
      recipe_url = element.search(".card__imageContainer a").first.attribute("href").value.strip
      recipe_html = URI.open(recipe_url).read
      recipe_doc = Nokogiri::HTML(recipe_html, nil, "utf-8")
      prep_element = recipe_doc.search(".recipe-meta-item").find do |element|
        element.text.strip.match?(/prep/i)
      end
      prep_time = prep_element ? prep_element.text.strip.match(/prep:\s+(?<prep>\d+)/i)[1] : nil

      results << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    @view.display(results)
    index = @view.ask_for_internet(:index)
    @cookbook.add_recipe(results[index])
    list
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
    list
  end
end
