require_relative '../genre'
require_relative '../item'

describe Genre do
  before(:each) do
    @genre = Genre.new('Hard Rock', id: 15)
    @item = Item.new('20/12/2020')
    @genre.add_item(@item)
  end
  context 'When creating a new genre' do
    it 'is an instance of Genre' do
      expect(@genre).to be_an_instance_of(Genre)
    end

    it 'name and id are correctly assigned' do
      expect(@genre.name).to eq('Hard Rock')
      expect(@genre.id).to eq(15)
    end
  end

  context 'When using the setter method for genre (add_item)' do
    it 'it adds the item to the genre' do
      expect(@genre.items.length).to eq(1)
    end

    it 'it adds the genre to the item' do
      expect(@item.genre.name).to eq('Hard Rock')
    end
  end
end
