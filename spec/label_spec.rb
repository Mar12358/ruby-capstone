require_relative '../label'
require_relative '../item'

describe Label do
  let(:label) { Label.new('Important', 'Red') }
  let(:item) { Item.new('20/12/2020') }
  it 'Create an instance of Label' do
    expect(label).to be_an_instance_of(Label)
    expect(label.title).to eq('Important')
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
