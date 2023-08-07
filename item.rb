require 'date'

class Item

  attr_accessor :publish_date
  attr_reader :genre, :author, :source, :label, :archived

  def initialize (publish_date, archived: false)
    @id = Random.rand(1000..9999)
    @genre = nil
    @author = nil
    @source = nil
    @label = nil
    @publish_date = Date.parse(publish_date)
    @archived = archived
  end

  def move_to_archive()
    @archived = true if can_be_archieved?
  end

  def add_genre(genre)
    @genre = genre
    genre.items << self unless genre.items.include?(self)
  end

  def add_author (author)
    @author = author
    author.items << self unless author.items.include?(self)
  end

  def add_source (source)
    @source = source
    source.items << self unless source.items.include?(self)
  end

  def add_label (label)
    @label = label
    label.items << self unless label.items.include?(self)
  end

  private

  def can_be_archieved?
    (Date.today.year - Date.parse(@publish_date).year) > 10
  end
end