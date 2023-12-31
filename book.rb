require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state, :publish_date
  attr_reader :label

  def initialize(publish_date, publisher: 'Unknown', cover_state: 'Unknown', archived: false)
    super(publish_date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archieved?
    super || @cover_state == 'bad'
  end
end
