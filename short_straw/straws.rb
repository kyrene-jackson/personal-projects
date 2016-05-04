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
end


class Player
  def initialize(name)
    @name = name
  end
end




class Game
  def initialize(player_names)
  end
  def done?
  end
  def show_round_number
  end
  def play_round
  end
  def show_results
  end
  def finish_round
  end
  def show_winner
  end
end







#==========================================================================
# GAME CODE

PLAYERS = %w(Mitch Byron Andrey Dan Larry Cynthia Luna Amelia Peter Anthony)

game = Game.new(PLAYERS)



#==========================================================================
# USER INTERFACE

puts "Welcome to the Last Straw Game!"
puts "In each round, players will draw straws of
  two different lengths."
puts "The players who pick the short straw will be
  eliminated and"
puts "a new round will begin, good luck!"

# MAIN GAME LOOP

# while !game.done? do
#   game.show_round_number
#   game.play_round
#   game.show_results
#   game.finish_round
# end
#
# game.show_winner
