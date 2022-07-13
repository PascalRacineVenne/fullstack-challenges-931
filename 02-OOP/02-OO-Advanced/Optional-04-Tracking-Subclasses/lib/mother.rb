class Mother
  def self.phone_kids
    ObjectSpace.each_object(Class)
               .select { |klass| klass < self}
               .each { |children| children.phone}
  end
end

# Daughter and Son are classes inheriting from Mother. They are defined
# in the specs, no need to create them.
