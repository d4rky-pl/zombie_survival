class Zombie
  include LivingObject

  def initialize(game)
    @game = game
    @x = 5
    @y = 5
  end

  def move
    @x += 1
  end

  def char
    "Z"
  end

  def color
    Curses::COLOR_GREEN
  end
end

class SmartZombie < Zombie

  def initialize
    @hp = 10
  end

  def char
    'S'
  end
end
