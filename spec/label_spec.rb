require_relative '../label.rb'
require_relative '../item.rb'

describe Label do
  let(:label) { Label.new('Important', 'Red') }
  let(:item) { Item.new('20/12/2020') }
  it 'Create an instance' do
    expect(label).to be_an_instance_of(Label)
    expect(label.title).to eq('Important')
    expect(label.color).to eq('Red')
  end
  it 'Add an item to the items instance variable' do
    label.add_item(item)
    expect(label.items.length).to eq(1)
  end
end
