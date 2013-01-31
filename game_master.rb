class GameMaster

  ZOMBIES_LIMIT = 10

  def initialize(game, zombies_array)
    @game = game
    @zombies = zombies_array
  end

  def tick
    if rand(20) == 0
      spawn_zombie
    end
  end

  private

  def spawn_zombie
    x,y = rand_position
    # TODO rand zombie type
    zombie = Zombie.new(@game)
    zombie.x, zombie.y = rand_position
    @zombies << zombie
  end

  def rand_position
    width, height = @game.width, @game.height
    if rand(2) == 0 # bottom/down
      [rand(1) == 0 ? 0 : width-1, rand(height)]
    else
      [rand(width), rand(1) == 0 ? 0 : height-1]
    end
  end


end