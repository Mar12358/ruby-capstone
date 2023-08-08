require 'json'
require_relative 'genre'
require_relative 'music_album'
require_relative 'label'
require_relative 'book'
require_relative 'game'

class App
  attr_reader :books, :music_albums, :games, :genres, :labels, :authors

  def initialize
    puts 'Welcome to the storage library App!'
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
  end

  def list_books
    if @books.empty?
      puts
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index})  Publisher: #{book.publisher}, Cover state: #{book.cover_state}, Date: #{book.publish_date}"
      end
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts
      puts 'No music_albums found'
    else
      @music_albums.each_with_index do |music_album, index|
        output = "#{index}) Genre: #{music_album.genre.name}, Publish Date: #{music_album.publish_date}, " \
                 "on spotify: #{music_album.on_spotify}"
        puts output
      end
    end
  end

  def list_games
    if @games.empty?
      puts
      puts 'No games found'
    else
      @games.each_with_index do |game, index|
        puts "#{index}) Title:#{game.label}  multiplayer: #{game.multiplayer}, Last time played: #{game.last_played_at}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts
      puts 'No genres found'
    else
      @genres.each { |genre| puts "#{genre.id}) #{genre.name}" }
    end
  end

  def list_labels
    if @labels.empty?
      puts
      puts 'No labels found'
    else
      @labels.each_with_index { |label, index| puts "#{index}) Title: #{label.title}, Color: #{label.color}" }
    end
  end

  def list_authors
    if @authors.empty?
      puts
      puts 'No authors found'
    else
      @authors.each_with_index do |author, index|
        puts "#{index}) First name: #{author.first_name}, Last name: #{author.last_name}"
      end
    end
  end

  def create_album(_album_label, _album_author, album_genre_id, publish_date, on_spotify)
    music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    genre = @genres.find { |element| element.id == album_genre_id }
    genre.add_item(music_album)
    music_album
  end
  def add_games(game_name, publish_date, last_played_at, multiplayer)
    game = Game.new(game_name, publish_date, multiplayer, last_played_at)
    @games << game
    puts 'Game added successfully!'
  end

  def add_music_album
    print 'Album Label: '
    album_label = gets.chomp.to_s.capitalize
    print 'Album Author: '
    album_author = gets.chomp.to_s.capitalize
    list_genres
    print 'Select Album Genre by index: '
    album_genre_id = gets.chomp.to_i
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'On spotify? [Y/N]: '
    spotify = gets.chomp.to_s.capitalize
    on_spotify = spotify == 'Y'

    @music_albums << create_album(album_label, album_author, album_genre_id, publish_date, on_spotify)
    puts 'Music album created succesfully'
  end

  def add_book
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'Publisher: '
    book_publisher = gets.chomp.to_s.capitalize
    print 'Cover State: '
    cover_state = gets.chomp.to_s
    @books << Book.new(publish_date, publisher: book_publisher, cover_state: cover_state)
    puts 'Book created succesfully'
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

  def load_genre_file
    return unless File.exist?('genre.json')

    genre_file = File.open('genre.json')
    genre_file_data = genre_file.read
    genre_json_file = JSON.parse(genre_file_data)
    genre_json_file.each_with_index do |genre, index|
      @genres << Genre.new(genre, id: index)
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

  def load_files
    load_genre_file
    load_books_file
    load_albums_file
  end

  def write_files
    write_albums_file
    write_books_file
  end
end
