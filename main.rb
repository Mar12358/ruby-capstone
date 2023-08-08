require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def show_options
    puts ''
    puts 'Select an option:'
    puts '1. List all books'
    puts '2. List all music albums'
    puts '3. List all games'
    puts '4. List all genres'
    puts '5. List all authors'
    puts '6. List all labels'
    puts '7. Add a book'
    puts '8. Add a music album'
    puts '9. add new game'
    puts '10. Quit'
  end

  def entry_point
    @app.load_files
    loop do
      show_options
      app_choice = gets.chomp.to_i
      options(app_choice)
    end
  end

  def options(input)
    case input
    when 1
      @app.list_books
    when 2
      @app.list_music_albums
    when 3
      @app.list_games
    when 4
      @app.list_genres
    when 5
      @app.list_authors
    when 6
      @app.list_labels
    when 7
      @app.add_book
    when 8
      @app.add_music_album
    when 9
      print 'Game Name: '
      game_name = gets.chomp.to_s
      print 'Publish Date [DD/MM/YYYY]: '
      publish_date = gets.chomp.to_s
      print 'Last time played [DD/MM/YYYY]: '
      last_played_at = gets.chomp.to_s
      print 'Multiplayer [Y/N]: '
      multiplayer = gets.chomp.to_s.capitalize
      multiplayer_game = false
      multiplayer_game = true if multiplayer == 'Y'

      @app.add_games(game_name, publish_date, last_played_at, multiplayer_game)
    when 10
      @app.write_files
      puts 'Thank you for using the Library Management System. Goodbye!'
      exit
    else
      puts 'Invalid option. Please try again.'
    end
  end
end

Main.new.entry_point
