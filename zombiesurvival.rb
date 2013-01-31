require "bundler/setup"
require "gaminator"
require "./objects/living_object.rb"
require "./objects/zombie.rb"
require "./objects/player.rb"

class ZombieSurvival
	def initialize(width, height)
    @time = 0
    @zombies = []
    # temp
    @zombies << Zombie.new(self)
		@ticks = 0
		@width = width
		@height = height
		@seconds = 0
		@kills = 0
    @player = SmartPlayer.new(self)
    @tick_count = 0

		initialize_player
	end

	def initialize_player
		@player = SmartPlayer.new(self)
	end

	def input_map
    {
        ?a => :move_left,
        ?d => :move_right,
        ?w => :move_up,
        ?s => :move_down,
        ?q => :exit,
    }
  end

  def move_left
    @player.move(:left)
  end

  def move_right
    @player.move(:right)
  end

  def move_up
    @player.move(:up)
  end

  def move_down
    @player.move(:down)
  end

	def tick
    @tick_count += 1
    move_zombies
    exit unless @player.alive?
	end

	def objects
		[@player] + @zombies
	end

	def sleep_time
		0.05
	end

	def textbox_content
		"Zombie killed: %d" % @kills
	end

	def wait?
		false
	end

	def exit
		Kernel.exit

	end

	def exit_message
		"Your brain was really delicious :3 You've survived %d seconds and killed %d zombies though" % [@seconds, @kills]
  end

  def width
    80
  end

  def height
    30
  end

  def try_moving_player(x,y)
    [x,y]
  end

  private

  def move_zombies
    @zombies.each do |zombie|
      if zombie.can_move?(@tick_count)
        zombie.try_moving
      end
    end
  end
end

Gaminator::Runner.new(ZombieSurvival, :rows => 30, :cols => 80).run

