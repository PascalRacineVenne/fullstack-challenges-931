class Post
  attr_reader :title, :author, :path, :content

  def initialize(attributes = {})
    @path = attributes[:path]
    @title = attributes[:title]
    @author = attributes[:author]
    @content = attributes[:content]
    @read = attributes[:read] == 'true'
  end

  def read?
    @read
  end

  def mark_as_read!
    @read = true
  end

  def to_s
    "#{@title}, #{@author}\n\n#{@content}"
  end
end