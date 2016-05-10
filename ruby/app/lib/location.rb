Facings = %i{NORTH WEST SOUTH EAST}

class Location
  attr_reader :x
  attr_reader :y
  attr_reader :facing
  attr_reader :table
  attr_reader :valid
  
  def initialize(table, x, y, facing)
    @table = table
    @valid = false
    if Facings.include?(facing)
      if table.checkCoords(x, y)
        @x = x
        @y = y
        @facing = facing
        @valid = true
      end
    end
  end

  def move
    return self unless @valid
    newLocation = case @facing
    when :NORTH
      Location.new(@table, @x, @y+1, @facing)
    when :WEST
      Location.new(@table, @x-1, @y, @facing)
    when :SOUTH
      Location.new(@table, @x, @y-1, @facing)
    when :EAST
      Location.new(@table, @x+1, @y, @facing)
    end
    if newLocation.valid then return newLocation else return self end
  end
  
  def left
    return self unless @valid
    return case @facing
      when :NORTH then Location.new(@table, @x, @y, :WEST)
      when :WEST then Location.new(@table, @x, @y, :SOUTH)
      when :SOUTH then Location.new(@table, @x, @y, :EAST)
      when :EAST then Location.new(@table, @x, @y, :NORTH)
    end
  end
  
  def right
    return self unless @valid
    return case @facing
      when :NORTH then Location.new(@table, @x, @y, :EAST)
      when :WEST then Location.new(@table, @x, @y, :NORTH)
      when :SOUTH then Location.new(@table, @x, @y, :WEST)
      when :EAST then Location.new(@table, @x, @y, :SOUTH)
    end
  end
end