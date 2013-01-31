class SmartPlayer

  include LivingObject

  attr_accessor :direction

  def initialize(game)
    @game = game
    @hp = 100
    @direction = :up
    set_start_position
  end

  def char
    "#"
  end

  def color
    return Curses::COLOR_RED if hp <= 30
    return Curses::COLOR_YELLOW if hp <= 70
    Curses::COLOR_GREEN
  end

  def max_hp
    100
  end

  def give_health
    self.hp = (hp + 25) % 100
  end

  def hit
    self.hp -= 10
  end

  def move(direction)
    @direction = direction
    new_x, new_y = @x, @y
    case direction
    when :up
      new_y -= 1
    when :down
      new_y += 1
    when :left
      new_x -= 1
    when :right
      new_x += 1
    end
    try_making_move(new_x, new_y)
  end

  private

  def set_start_position
    self.x = @game.width/2
    self.y = @game.height/2 +8
  end

  def try_making_move(new_x,new_y)
    if new_x >= 0 && new_y >= 0 && new_x < @game.width && new_y < @game.height
      if @game.is_allowed?(new_x, new_y)
        self.x = new_x
        self.y = new_y
      end
    end
  end


end
