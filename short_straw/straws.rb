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

puts "Welcome to the Last Straw Game!"
puts "In each round, players will draw straws of
  two different lengths."
puts "The players who pick the short straw will be
  eliminated and"
puts "a new round will begin, good luck!"

PLAYERS = %w(Mitch Byron Andrey Dan Larry Cynthia Luna Amelia Peter Anthony)
