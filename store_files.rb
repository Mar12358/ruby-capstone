require 'json'
require_relative 'genre'
require_relative 'label'
require_relative 'book'
require_relative 'game'
require_relative 'music_album'

module StoreMethods
  def load_genre_file
    return unless File.exist?('genre.json')

    genre_file = File.open('genre.json')
    genre_file_data = genre_file.read
    genre_json_file = JSON.parse(genre_file_data)
    genre_json_file.each_with_index do |genre, index|
      @genres << Genre.new(genre, id: index)
    end
  end

  def load_books_file
    return unless File.exist?('books.json')

    books_file = File.open('books.json')
    books_file_data = books_file.read
    books_json_file = JSON.parse(books_file_data)
    books_json_file.each do |book|
      @books << Book.new(book['publish_date'], publisher: book['publisher'], cover_state: book['cover_state'],
                                               archived: book['archived'])
    end
  end

  def load_albums_file
    return unless File.exist?('music_albums.json')

    albums_file = File.open('music_albums.json')
    albums_file_data = albums_file.read
    albums_json_file = JSON.parse(albums_file_data)
    albums_json_file.each do |album|
      @music_albums << create_album(album['label'], album['author'], album['genre'], album['publish_date'],
                                    album['on_spotify'])
    end
  end

  def write_books_file
    return unless @books.any?

    books_array = []
    @books.each do |book|
      book_prop = {
        publish_date: book.publish_date,
        publisher: book.publisher,
        cover_state: book.cover_state,
        archived: book.archived
      }
      books_array << book_prop
    end
    File.write('books.json', JSON.pretty_generate(books_array))
  end

  def write_albums_file
    return unless @music_albums.any?

    albums_array = []
    @music_albums.each do |object|
      album_prop = {
        label: object.label,
        author: object.author,
        genre: object.genre.id,
        publish_date: object.publish_date,
        on_spotify: object.on_spotify
      }
      albums_array << album_prop
    end
    music_albums_json = JSON.generate(albums_array)
    File.write('music_albums.json', music_albums_json)
  end
end