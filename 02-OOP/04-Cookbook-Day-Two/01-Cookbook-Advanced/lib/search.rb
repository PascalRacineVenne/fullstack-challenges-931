require 'open-uri'
require 'nokogiri'
require_relative 'recipe'

class Search
  BASE_URL = "https://www.allrecipes.com/search/results/?search="

  def initialize(ingredient)
    @ingredient = ingredient
  end

  def call
    html_doc = URI.open("#{BASE_URL}#{@ingredient}").read
    xml_doc = Nokogiri::HTML(html_doc)
    results = []
    xml_doc.search(".card__recipe").first(5).each do |element|
      name = element.search(".card__imageContainer a").first.attribute("title").value.strip
      description = element.search(".card__detailsContainer .card__summary").first.text.strip
      rating_element = element.search(".card__detailsContainer .review-star-text").first
      rating = rating_element ? rating_element.text.strip.match(/\d.?\d*/)[0] : nil
      recipe_url = element.search(".card__imageContainer a").first.attribute("href").value.strip
      recipe_html = URI.open(recipe_url).read
      recipe_doc = Nokogiri::HTML(recipe_html, nil, "utf-8")
      prep_scrape = recipe_doc.search(".recipe-meta-item").find do |element|
        element.text.strip.match?(/prep/i)
      end
      prep_time = prep_scrape ? prep_scrape.text.strip.match(/prep:\s+(?<prep>\d+)/i)[1] : nil
      results << Recipe.new(name: name, description: description, rating: rating, prep_time: prep_time)
    end
    results
  end
end

# scraping_results = Search.new('chocolate').call
# p scraping_results
