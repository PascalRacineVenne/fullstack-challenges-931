require 'open-uri'
require 'nokogiri'

require_relative 'view'
require_relative 'post'

class Controller
  BASE_URL = "https://dev.to/".freeze
  USER_AGENT = "Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0".freeze
  def initialize(repo)
    @repo = repo
    @view = View.new
  end

  def index
    list
  end

  def create
    path = @view.ask_for(:path)
    file = URI.open("#{BASE_URL}#{path}", "User-Agent" => USER_AGENT).read
    doc = Nokogiri::HTML(file)
    title = doc.search("h1").first.text.strip
    paragraphs = doc.search("#article-body p")
    content = paragraphs.map(&:text).join("\n\n")
    author = doc.search(".crayons-article__header__meta a.crayons-link.fw-bold").text.strip
    post = Post.new(path: path, title: title, content: content, author: author)
    @repo.add(post)
    list
  end
  
  def show
    list
    index = @view.ask_for_index
    post = @repo.find(index)
    @view.display_one(post)
  end
  
  def mark_as_read
    list
    index = @view.ask_for_index
    @repo.mark_as_read(index)
    list
  end
  
  private
  
  def list
    posts = @repo.all
    @view.display(posts)
  end
end