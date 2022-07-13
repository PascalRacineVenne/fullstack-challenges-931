# require "../spec/mother_spec"

class Mother

  def self.inherited(subclass)
    puts "New subclass: #{subclass}"
  end

  def self.phone_kids
    
  end
end

class Son < Mother
  @phoned = false

  class << self
    attr_accessor :phoned
  end

  def self.phone
    self.phoned = true
  end
end

class Daughter < Mother
  @phoned = false

  class << self
    attr_accessor :phoned
  end

  def self.phone
    self.phoned = true
  end
end


# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
# p son = Son.new
p mom = Mother.new
Mother.inherited(Son)
Mother.phone_kids