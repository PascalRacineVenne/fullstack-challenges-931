class View
  def display(posts)
    posts.each_with_index do |post, index|
      marker = post.read? ? "[x]" : "[ ]"
      # 1. [x] - Visual Studio Code plugins for Ruby and Rails (Magnus Skog)
      puts "#{index + 1}. #{marker} - #{post.title} => (#{post.author})"
    end
  end

  def ask_for(stuff)
    puts "Please enter a #{stuff}"
    print "> "
    gets.chomp
  end

  def ask_for_index
    puts "Pick an index"
    print "> "
    gets.chomp.to_i - 1
  end

  def display_one(post)
    puts post
  end
end