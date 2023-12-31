require 'json'
require_relative 'genre'
require_relative 'author'
require_relative 'music_album'
require_relative 'label'
require_relative 'book'
require_relative 'game'
require_relative 'store_files'

class App
  attr_reader :books, :music_albums, :games, :genres, :labels, :authors

  include StoreMethods

  def initialize
    puts 'Welcome to the storage library App!'
    @books = []
    @music_albums = []
    @games = []
    @genres = []
    @labels = []
    @authors = []
    @items = []
  end

  def list_books
    if @books.empty?
      puts
      puts 'No books found'
    else
      @books.each_with_index do |book, index|
        puts "#{index}) Label: #{book.label.title}, Publisher: #{book.publisher}, " \
             "Cover state: #{book.cover_state}, Date: #{book.publish_date}"
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
        puts "#{index}) Publish Date: #{game.publish_date}  Multiplayer: #{game.multiplayer}, " \
             "Last Time Played: #{game.last_played_date}"
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

  def create_book(book_label_id, book_publisher, publish_date, cover_state)
    book = Book.new(publish_date, publisher: book_publisher, cover_state: cover_state)
    label = @labels.find { |element| element.id == book_label_id }
    label.add_item(book)
    book
  end

  def create_album(album_genre_id, publish_date, on_spotify)
    music_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)
    genre = @genres.find { |element| element.id == album_genre_id }
    genre.add_item(music_album)
    music_album
  end

  def add_game
    print 'Game Name: '
    gets.chomp.to_s
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'Last time played [DD/MM/YYYY]: '
    last_played_date = gets.chomp.to_s
    print 'Multiplayer [Y/N]: '
    multiplayer = gets.chomp.to_s.capitalize
    game = Game.new(publish_date, multiplayer, last_played_date)
    @games << game
    puts 'Game added successfully!'
  end

  def add_music_album
    list_genres
    print 'Select Album Genre by index: '
    album_genre_id = gets.chomp.to_i
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'On spotify? [Y/N]: '
    spotify = gets.chomp.to_s.capitalize
    on_spotify = spotify == 'Y'

    @music_albums << create_album(album_genre_id, publish_date, on_spotify)
    puts 'Music album created succesfully'
  end

  def add_book
    list_labels
    print 'Select the book label by index: '
    book_label_id = gets.chomp.to_i
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'Publisher: '
    book_publisher = gets.chomp.to_s.capitalize
    print 'Cover State: '
    cover_state = gets.chomp.to_s
    @books << create_book(book_label_id, book_publisher, publish_date, cover_state)
    puts 'Book created succesfully'
  end

  def load_files
    load_label_file
    load_genre_file
    load_books_file
    load_albums_file
    load_author_file
    load_game_file
  end

  def write_files
    write_albums_file
    write_books_file
    write_game_file
  end

  def add_author(first_name, last_name)
    author = Author.new(first_name, last_name)
    @authors << author
    puts 'Author added successfully!'
  end

  def associate_author_with_item(item)
    author = @authors[author_index]
    author.add_item(item)
    puts 'Item associated with author!'
  end

  def list_items
    if @items.empty?
      puts 'No items found.'
    else
      @items.each_with_index do |item, index|
        puts "#{index}) Title: #{item.label}, Published on: #{item.publish_date}"
      end
    end
  end
end
