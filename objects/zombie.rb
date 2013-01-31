class Zombie
  include LivingObject

  def initialize(game)
    @hp = 1
    @game = game
    @x = 5
    @y = 5
    @last_tick_count = 0
    @ticks_needed = 25
  end

  def try_moving(player)
    sign_x = 1
    sign_y = 1

    sign_x = -1 if player.x < @x
    sign_y = -1 if player.y > @y

    move_x = sign_x * 1
    move_y = sign_y * 1 

    if rand(5) > 2 
      @x += move_x  
    else
      @y -= move_y
    end
  end

  def char
    "Z"
  end

  def color
    Curses::COLOR_GREEN
  end
end

class SmartZombie < Zombie

  def initialize(game)
    @hp = 10
    @ticks_needed = 20
    super
  end

  def char
    'S'
  end
end
