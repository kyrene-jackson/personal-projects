#
# Ruby For Kids Project 7: Straws
# Tutorial By: Chris Haupt
# Programmed By: Kyrene Jackson
# Elimination-round, tournament-style, avoid the
# shortest straw, or else!
#
#
# Game Skeleton:
# This game will be played among a group of pre-created players.
# Each round, the game will create a set of straws of varying lengths.
# It will count how many players remain in the game
# and assign a straw to each player.
# It will print a message stating the current round number,
# and display the straws held by each player.
# The game will remove the player holding the shortest straw.
# If there is more than one player remaining, a new round will start.
# When only one player remains, the game will end and display the winner.

#==========================================================================
# CLASSES

class Straw
  SHORT_STRAW = 5
  LONG_STRAW = 20
  def initialize(size)
    @straw_size = size
  end
  def short?
    @straw_size == SHORT_STRAW
  end
  def appearance
    '=' * @straw_size
  end
  def self.create_bundle(short, long)
    bundle = []
    1.upto(long) do
      bundle << Straw.new(SHORT_STRAW)
    end
    1.upto(long) do
      bundle << Straw.new(LONG_STRAW)
    end
    bundle
  end
end


class Player
  attr_reader :name
  attr_accessor :straw
  def initialize(name)
    @name = name
  end
  def appearance
    "#{straw.appearance} #{name}"
  end
  def short_straw?
    straw.short?
  end
end


class Game
  def initialize(player_names)
    @players = []
      player_names.each do |name|
        @players.push(Player.new(name))
      end
      @rounds = 1
  end
  def done?
    @players.length <= 1
  end
  def show_round_number
    puts " "
    puts "----> Round #{@rounds}"
    puts " "
  end
  def play_round
    bundle_of_straws = setup_new_bundle
    0.upto(@players.length - 1) do |index|
      player = @players[index]
      player.straw = bundle_of_straws.pop
    end
  end
  def setup_new_bundle
    number_of_players = @players.length
    bundle = Straw.create_bundle(1, number_of_players - 1)
    bundle.shuffle
  end
  def show_results
    @players.each do |player|
      puts player.appearance
    end
  end
  def finish_round
    @players.delete_if do |player|
      player.short_straw?
    end
    @rounds += 1
  end
  def show_winner
    last_player = @players.first
    puts " "
    puts "The winner is #{last_player.name}"
    puts " "
  end
end

#==========================================================================
# USER INTERFACE

puts "Welcome to the Last Straw Game!"
puts "In each round, players will draw straws of
two different lengths."
puts "The players who pick the short straws will be
eliminated and a new round will begin."
puts "The game will continue until only one player is left"
puts "with a long straw!"
puts "Can you guess which player is going to win? :)"

PLAYERS = %w(Mitch Byron Andrey Chuck Larry Cynthia Luna Amelia Peter Anthony)

game = Game.new(PLAYERS)


# MAIN GAME LOOP

while !game.done? do
  game.show_round_number
  game.play_round
  game.show_results
  game.finish_round
end

game.show_winner
