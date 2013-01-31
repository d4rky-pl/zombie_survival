class Particle
  include LivingObject

  LIVE_TIME = 3

  def initialize(x,y)
    @x = x
    @y = y
  end

  def color
    Curses::COLOR_YELLOW
  end

  def char
    "*"
  end

end