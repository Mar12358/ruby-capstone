require_relative 'genre'
require_relative 'music_album'

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
        puts "#{index}) Title:#{book.label}  Publisher: #{book.publisher},
         Cover state: #{book.cover_state}, Date: #{book.publish_date}"
      end
    end
  end

  def list_music_albums
    if @music_albums.empty?
      puts
      puts 'No music_albums found'
    else
      @music_albums.each_with_index do |music_album, index|
        puts "#{index}) Publish Date: #{music_album.publish_date}, on spotify: #{music_album.on_spotify}"
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
      @genres.each_with_index { |genre, index| puts "#{index}) Name:#{genre.name}" }
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

  def add_games(game_name, publish_date, last_played_at, multiplayer)
    game = Game.new(game_name, publish_date, multiplayer, last_played_at)
    @games << game
    puts 'Game added successfully!'
  end

  def add_music_album
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'On spotify? [Y/N]: '
    spotify = gets.chomp.to_s.capitalize
    on_spotify = spotify == 'Y'
    @music_albums << MusicAlbum.new(publish_date, on_spotify: on_spotify)
    puts 'music album created succesfully'
  end
end
