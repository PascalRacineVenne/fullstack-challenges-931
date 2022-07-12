class Coffee
  def initialize(origin, color, intensity)
    @origin = origin
    @color = color
    @intensity = intensity
    @brewed = false
  end

  def brewed?
    @brewed
  end

  def brewing
    @brewed = true
  end
end
