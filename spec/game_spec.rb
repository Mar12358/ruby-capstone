require_relative '../game'
require 'rspec'

RSpec.describe Game do
  describe '#can_be_archived?' do
    it 'returns true if the game can be archived' do
      game = Game.new('Game Title', '2000-01-01', true, '2010-01-01')
      expect(game.can_be_archived?).to be(true)
    end

    it 'returns false if the game cannot be archived' do
      # test  of case where the game cannot be archived
      game = Game.new('Game Title', '2021-01-01', true, '2023-01-01')
      expect(game.can_be_archived?).to be(false)
    end
  end
end
