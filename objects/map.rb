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

	def initialize(width, height)
    @tiles = []
    draw
	end	

  def draw
    map = [
      [ 1, 1, "."],
      [ 2, 2, "#"]
    ]
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

