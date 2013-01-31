class Particle
  include LivingObject

  LIVE_TIME = 3

  def initialize(x,y)
    @x = x
    @y = y
  end

  def char
    "*"
  end

end