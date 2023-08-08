require_relative 'item'

class Game < Item
  attr_accessor :multiplayer, :last_played_date, :game_name

  def initialize(game_name, publish_date, multiplayer,
                 last_played_date, archived: false)
    super(publish_date, archived: archived)
    @game_name = game_name
    @multiplayer = multiplayer
    @last_played_date = Date.parse(last_played_date)
  end

  def can_be_archived?
    current_date = Date.today
    super && (current_date.year - @last_played_date.year) > 2
  end
end
