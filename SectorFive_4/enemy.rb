class Enemy
  attr_reader :x, :y, :angle, :radius, :shoot_frequency, :can_shoot, :shooter_image
  attr_writer :angle, :can_shoot, :speed, :shoot_frequency, :image
  def initialize(window)
    @radius = 20
    @x = rand(window.width - 2 * @radius) + @radius
    @y = 0
    @angle = 180
    @image = Gosu::Image.new('images/enemy.png')
    @shooter_image = Gosu::Image.new('images/enemy_shooter.png')
    @can_shoot = false
    @speed = 1.5
    @window = window
    @shoot_frequency = 1
  end
  def move
    @y += Gosu.offset_y(@angle, @speed)
    @x += Gosu.offset_x(@angle, @speed)
    if @x > @window.width - @radius
      @angle += (180 - @angle) * 2
      @x = @window.width -  radius
    end
    if @x < @radius
      @angle -= (@angle - 180) * 2
      @x = @radius
    end
  end
  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
