class Zombie
  include LivingObject

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
