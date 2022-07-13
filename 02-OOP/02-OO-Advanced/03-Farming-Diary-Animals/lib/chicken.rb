require_relative "animal"

class Chicken < Animal
  attr_reader :eggs

  def initialize(gender)
    super()
    @eggs = 0
    @gender = gender
  end

  def talk
    @gender == "female" ? "cluck cluck" : "cock-a-doodle-doo"
  end

  def feed!
    super()
    @eggs += 2 if @gender == "female"
  end
end
