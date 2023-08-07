require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(publish_date, on_spotify: false, archived: false)
    super(publish_date, archived: archived)
    @on_spotify = on_spotify
  end

  def can_be_archieved?
    super && @on_spotify
  end
end
