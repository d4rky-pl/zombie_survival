class SmartPlayer

  include LivingObject

  def initialize(game)
    @game = game
    @hp = 100
    put_in_the_middle
  end


  attr_accessor :hp, :x, :y

  def alive?
    hp > 0
  end

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
    self.hp = (hp + 25) % 100
  end

  def move(direction)
  end

  def hit
    self.hp -= 10
  end

  def shoot

  end

  private

  def put_in_the_middle
    self.x = @game.width/2
    self.y = @game.height/2
  end


end
