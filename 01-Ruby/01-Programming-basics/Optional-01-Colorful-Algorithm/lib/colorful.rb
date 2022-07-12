def colorful?(number)
  # TODO: return true if the number is colorful, false otherwise
  return false unless number.is_a?(Integer)
  return true if number < 10

  digits = number.to_s.chars.map(&:to_i)
  products = digits.clone
  case digits.size
  when 2
    products << (digits.first * digits.last)
  when 3
    products << (digits.first * digits[1])
    products << (digits[1] * digits.last)
    products << (digits.first * digits[1] * digits.last)
  end
  p products
  products == products.uniq
end

p colorful?(263) # true
p colorful?(236) # false