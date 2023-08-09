require_relative '../book'
require_relative '../item'
require 'date'

describe Book do
  let(:book) { Book.new('12/12/2020', publisher: 'Lee Sin', cover_state: 'bad') }
  let(:label) { Label.new('Alejuda', 'Red') }
  it 'Create an instance' do
    expect(book).to be_an_instance_of(Book)
    expect(book.publish_date).to be_an_instance_of(Date)
    expect(book.cover_state).to eq('bad')
  end
  it 'can be archieved if the cover_state is equal to bad' do
    expect(book.can_be_archieved?).to eq(true)
  end
end
