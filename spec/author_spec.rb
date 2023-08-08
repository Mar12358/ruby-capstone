require_relative '../author'
require_relative '../item'
require 'rspec'

RSpec.describe Author do
  describe '#add_item' do
    let(:author) { Author.new('Alice', 'Teddy') }
    let(:item) { double('item', add_author: nil) }

    it 'should add the item to the author\'s items list' do
      author.add_item(item)
      expect(author.items).to include(item)
    end

    it 'should call add_author on the item' do
      expect(item).to receive(:add_author).with(author)
      author.add_item(item)
    end
  end
end
