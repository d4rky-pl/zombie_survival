class Map
  class Tile
    attr_reader :x, :y
    attr_accessor :walkable

    def initialize(x, y, char)
      @x = x
      @y = y
      @char = char
    end

    def char 
      @char
    end

    def color
      Curses::COLOR_WHITE
    end

    def is_colliding?(x, y) 
      !@walkable && @x == x && @y == y
    end

    protected
    def is_walkable?
      walkables = [ "." ]
      walkables.include?(@char)
    end
  end 

	def initialize(width, height, player)
    @width = width
    @height = height
    @tiles = []
    @player = player
    draw
	end	

  def draw
    center_x = (@width/2).floor
    center_y = (@height/2).floor

    map = []

    20.times do |i|
      rand_x = rand(@width)
      rand_y = rand(@height)

      continue if @player.x == rand_x && @player.y == rand_y    
      map << [ rand_x, rand_y, "O" ]   
    end

    map << [ center_x - 6, center_y + 8, "#"]
    map << [ center_x - 5, center_y + 7, "#"]
    map << [ center_x - 4, center_y + 6, "#"]
    map << [ center_x - 3, center_y + 6, "#"]
    map << [ center_x - 2, center_y + 6, "#"]
    map << [ center_x - 1, center_y + 6, "#"]
    map << [ center_x - 0, center_y + 6, "#"]
    map << [ center_x + 1, center_y + 6, "#"]
    map << [ center_x + 2, center_y + 6, "#"]
    map << [ center_x + 3, center_y + 6, "#"]
    map << [ center_x + 4, center_y + 6, "#"]
    map << [ center_x + 5, center_y + 7, "#"]
    map << [ center_x + 6, center_y + 8, "#"]

    map.each do |positions|
      @tiles << Tile.new(*positions)
    end
  end 

  def objects
    @tiles
  end

  def is_colliding?(x,y)
    collides = false
    @tiles.each do |tile|
     collides = true if tile.is_colliding?(x,y)
    end
    collides
  end
end

