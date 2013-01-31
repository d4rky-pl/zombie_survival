require "bundler/setup"
require "gaminator"
require "./objects/zombie.rb"
require "./objects/player.rb"

class ZombieSurvival
	def initialize(width, height)
		@ticks = 0
		@width = width
		@height = height
		@seconds = 0
		@kills = 0
	end

	def input_map
		{}
	end

	def tick
	end

	def objects
		[]
	end

	def sleep_time
		0.1
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
end

Gaminator::Runner.new(ZombieSurvival, :rows => 30, :cols => 80).run

