class Label
  attr_accessor :id, :title, :color, :items

  def initialize (title, color)
    @id = Random.rand(1000..9999)
    @title = title
    @color = color
    @items = []
  end

end