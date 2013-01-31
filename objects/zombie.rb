class Zombie
  include LivingObject

  def initialize(game)
    @game = game
    @x = 5
    @y = 5
    @last_tick_count = 0
    @ticks_needed = 10
  end

  def try_moving
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
    @ticks_needed = 5
  end

  def char
    'S'
  end
end
