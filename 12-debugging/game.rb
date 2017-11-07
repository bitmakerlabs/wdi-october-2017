require 'pry'
require_relative 'player.rb'

class Game

  def initialize(number_of_players)
    @width = 500
    @height = 400

    puts "Width: #{@width}"
    puts "Height: #{@height}"

    number_of_players.times do
      x_position = (0..@width).to_a.sample
      y_position = (0..@height).to_a.sample

      @players << Player.new
    end
  end

  def self.start
    puts "It's Adventure Time!"
    print "How many people are adventuring? "
    number_of_players = gets.chomp.to_i

    g = Game.new(number_of_players)
    game.turn
  end

  def turn
    moves = [1, -1]

    @players.each do |player|
      puts "Player #{player.id} moved!"
      new_x = moves.sample
      new_y = moves.sample

      if new_x >= 0 && new_x < width
        player.x += new_x
      end

      if new_y >= 0 && new_y < height
        player.y += new_y
      end
    end
  end

end

Game.start
