#
# Ruby For Kids Project 6: Guessing Game
# Tutorial By: Chris Haupt
# Programmed By: Kyrene Jackson
# A guessing game in which the hints might not be true!
#
#=======================================================
# Create the game class

class Game
  TOTAL_ROUNDS = 3
end

# Create the player class

class Player
def initialize(name)
  @name = name
  @score = 0
  prepare_for_new_round
end
def prepare_for_new_round
  @total_guess_count = 0
  @high_number = 0
  @current_guess = 0
  @current_number_of_guesses = 0
end


end


#=======================================================
# Create a helpful message that will explain to the player
# what's about to happen

puts "Welcome to the Guessing Game"
puts "We will play #{Game::TOTAL_ROUNDS} rounds. Try to guess the number"
puts "i'm thinking of in the fewest guesses."
puts "You'll also estimate how many guesses it will take."
puts "If you do it in fewer guesses, you'll gain bonus points!"






#=======================================================
# Set game variables

print "What is your name? "
name = gets.chomp
player = Player.new(name)
game = Game.new(player)

#=======================================================

# Create main game loop

while !game.done? do
  puts " "
  puts "------> Round ##{game.round}"
  puts " "
  if game.get_high_number
    if game.get_guess_count
      game.prepare_computer_number
      while !game.round_done? do
        puts " "
        game.get_player_guess
        game.show_results
      end
      game.next_round
    end
  end
end

puts " "
game.print_final_score
