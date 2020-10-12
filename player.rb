class Player
  attr_reader :name, :is_alive, :lives
  def initialize(name)
    @lives = 3
    @is_alive = true
    @name = name
  end

  def lose_life()
    @lives -= 1
    if @lives <= 0
      @is_alive = false
    end
  end

end