class Enemy
  SPEED = 2
  attr_reader :x, :y, :angle, :radius
  def initialize(window)
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
    @y = 0
    @angle = 180
    @image = Gosu::Image.new('images/enemy.png')
  end
  def move
    @y += SPEED
  end
  def draw
    @image.draw(@x - @radius, @y - @radius, 1)
  end
end
