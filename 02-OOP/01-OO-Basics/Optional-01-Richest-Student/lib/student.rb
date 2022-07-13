class Student
  include Comparable
  attr_reader :name

  def initialize(name, fives, tens, twenties)
    @name = name
    @fives = fives
    @tens = tens
    @twenties = twenties
  end

  def wealth
    (@fives * 5) + (@tens * 10) + (@twenties * 20)
  end

  def <=>(other)
    wealth <=> other.wealth
  end
end
