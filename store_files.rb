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

  def load_label_file
    return unless File.exist?('label.json')

    label_file = File.open('label.json')
    label_file_data = label_file.read
    label_json_file = JSON.parse(label_file_data)
    label_json_file.each_with_index do |label, index|
      @labels << Label.new(label['name'], label['color'], id: index)
    end
  end

  def load_books_file
    return unless File.exist?('books.json')

    books_file = File.open('books.json')
    books_file_data = books_file.read
    books_json_file = JSON.parse(books_file_data)
    books_json_file.each do |book|
      @books << create_book(book['label'], book['publisher'], book['publish_date'], book['cover_state'])
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

  def load_game_file
    return unless File.exist?('game.json')

    game_file = File.open('game.json')
    game_file_data = game_file.read
    game_json_file = JSON.parse(game_file_data)
    game_json_file.each do |game|
      @games << Game.new(game['publish_date'], game['multiplayer'], game['last_played_date'])
    end
  end

  def load_author_file
    return unless File.exist?('author.json')

    author_file = File.open('author.json')
    author_file_data = author_file.read
    author_json_file = JSON.parse(author_file_data)
    author_json_file.each_with_index do |author, _index|
      @authors << Author.new(author['first_name'], author['last_name'], id: author['id'])
    end
  end

  def write_books_file
    return unless @books.any?

    books_array = []
    @books.each do |book|
      book_prop = {
        label: book.label.id,
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

  def write_game_file
    return unless @games.any?

    game_array = []
    @games.each do |game|
      game_prop = {
        publish_date: game.publish_date,
        multiplayer: game.multiplayer,
        last_played_date: game.last_played_date,
        archived: game.archived
      }
      game_array << game_prop
    end
    File.write('game.json', JSON.pretty_generate(game_array))
  end
end
