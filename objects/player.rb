class SmartPlayer

  def initialize(game)
    @game = game
  end


  attr_accessor :hp, :x, :y

  def char
    "#"
  end

  def color
    return Curses::COLOR_RED if hp < 50
    return Curses::COLOR_YELLOW if hp < 10
    Curses::COLOR_GREEN
  end

  def max_hp
    100
  end

  def give_health
    hp = (hp + 25) % 100
  end

  def move(direction)
  end

  def hit
    hp -= 10
  end

  def shoot

  end


end
