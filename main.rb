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
    puts '8. Add a music album'
    puts '9. Add new game'
    puts '10. Add an author'
    puts '11. Associate author with item'
    puts '12. Quit'
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
    when 8
      @app.add_music_album
    when 9
      add_game
    when 10
      add_author
    when 11
      associate_author_with_item
    when 12
      exit_application
    else
      puts 'Invalid option. Please try again.'
    end
  end

  private

  def add_game
    print 'Game Name: '
    game_name = gets.chomp.to_s
    print 'Publish Date [DD/MM/YYYY]: '
    publish_date = gets.chomp.to_s
    print 'Last time played [DD/MM/YYYY]: '
    last_played_date = gets.chomp.to_s
    print 'Multiplayer [Y/N]: '
    multiplayer = gets.chomp.to_s.capitalize
    multiplayer_game = multiplayer == 'Y'

    @app.add_games(game_name, publish_date, last_played_date, multiplayer_game)
  end

  def add_author
    print 'Author First Name: '
    author_first_name = gets.chomp
    print 'Author Last Name: '
    author_last_name = gets.chomp
    @app.add_author(author_first_name, author_last_name)
  end

  def associate_author_with_item
    @app.list_authors
    print 'Author Index: '
    author_index = gets.chomp.to_i
    @app.list_items
    print 'Item Index: '
    item_index = gets.chomp.to_i
    @app.associate_author_with_item(author_index, item_index)
  end

  def exit_application
    @app.write_files
    puts 'Thank you for using the Library Management System. Goodbye!'
    exit
  end
end

Main.new.entry_point
