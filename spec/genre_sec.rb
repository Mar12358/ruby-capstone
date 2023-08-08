require_relative '../genre'
require_relative '../item'

describe Genre do
  before(:each) do
    @genre = Genre.new('Hard Rock', 15)
    @item = Item.new('20/12/2020')
  end

  it 'Create an instance of Genre' do
    expect(@genre).to be_an_instance_of(Genre)
    expect(label.title).to eq('Hard Rock')
    expect(label.color).to eq('Red')
  end
  it 'Add an item to the items instance variable' do
    label.add_item(item)
    expect(label.items.length).to eq(1)
  end

  it 'Use the setter method of the item to set the item label' do
    label.add_item(item)
    expect(item.label).to eq(label)
  end
end
