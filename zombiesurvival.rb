require "bundler/setup"
require "gaminator"
require "./objects/living_object.rb"
require "./objects/zombie.rb"
require "./objects/player.rb"
require "./objects/particle.rb"

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
    @particles = []
    @particles_tick_count = 0

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
        ?x => :try_shooting,
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
    @particles_tick_count -= 1
    @particles = [] if @particles_tick_count < 0
    exit unless @player.alive?
	end

	def objects
		[@player] + @zombies + @particles
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
    77
  end

  def height
    22
  end

  def try_moving_player(x,y)
    [x,y]
  end

  def try_shooting
    draw_shoot(@player.direction)
  end

  def object_positions
    objects.map{|o| [o.x, o.y]}
  end

  private

  def draw_shoot(direction)
    x,y = @player.x, @player.y
    particles_positions.each do |pos|
      @particles << Particle.new(*pos)
    end
    @particles_tick_count = Particle::LIVE_TIME
  end

  def move_zombies
    @zombies.each do |zombie|
      if zombie.can_move?(@tick_count)
        zombie.try_moving
      end
    end
  end

  def particles_positions
    x, y, direction = @player.x, @player.y, @player.direction
    objects = object_positions
    positions = []
    case direction
      when :left
        x -= 1
        x.downto(0) do |x_pos|
          break if object_positions.include?([x_pos,y])
          positions << [x_pos, y]
        end
      when :right
        x += 1
        x.upto(width) do |x_pos|
          break if object_positions.include?([x_pos,y])
          positions << [x_pos, y]
        end
      when :up
        y -= 1
        y.downto(0) do |y_pos|
          break if object_positions.include?([x,y_pos])
          positions << [x, y_pos]
        end
      when :down
        y += 1
        y.upto(height) do |y_pos|
          break if object_positions.include?([x,y_pos])
          positions << [x, y_pos]
        end
    end
    positions
  end
end

Gaminator::Runner.new(ZombieSurvival, :rows => 30, :cols => 80).run

