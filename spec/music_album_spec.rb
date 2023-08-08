require_relative '../music_album'
require 'date'

describe MusicAlbum do
  before(:each) do
    @music_album = MusicAlbum.new('14/04/2020', on_spotify: true)
    @music_album2 = MusicAlbum.new('15/04/2020', on_spotify: false)
    @music_album_archivable = MusicAlbum.new('14/04/1989', on_spotify: true)
  end

  context 'When creating a new music album' do
    it 'is an instance of MusicAlbum' do
      expect(@music_album).to be_an_instance_of(MusicAlbum)
    end

    it 'is on_spotify if initilized as so' do
      expect(@music_album.on_spotify).to be_truthy
      expect(@music_album2.on_spotify).to be_falsey
    end

    it 'has a publish_date instance of Date' do
      expect(@music_album.publish_date).to be_an_instance_of(Date)
    end
    it 'can be archived if old enougth and on spotify (can\'t if otherwise)' do
      expect(@music_album.can_be_archieved?).to be_falsey
      expect(@music_album2.can_be_archieved?).to be_falsey
      expect(@music_album_archivable.can_be_archieved?).to be_truthy
    end
  end
end
