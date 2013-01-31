class Tile
	attr_accessor :walkable

	def initialize(opts={})
	  @char = opts[:char] || " "
    @walkable = opts[:walkable] || true
	end

  def char 
    @char
  end

  def color
    Curses::COLOR_WHITE
  end

  def self.parse_from_str(char)
    if char == |
      Tile.new({char: char, walkable: false})
    else   
      Tile.new
    end
  end


end 

