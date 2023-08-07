class Genre
  attr_accessor :name, :items, :id

  def initialize(name)
    @id = Random.rand(1000..9999)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
    item.add_genre(self)
  end
end
