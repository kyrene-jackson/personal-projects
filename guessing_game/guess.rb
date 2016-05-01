#
# Ruby For Kids Project 6: Guessing Game
# Tutorial By: Chris Haupt
# Programmed By: Kyrene Jackson
# A guessing game in which the hints might not be true!
#
#=======================================================
# Create the game class

class Game
  attr_reader :round
  TOTAL_ROUNDS = 3
def initialize(player)
  @player = player
  @round = 0
  next_round
  end
def next_round
  @computers_number = 0
  @round_done = false
  @round += 1
  @player.prepare_for_new_round
  end
def done?
  @round > TOTAL_ROUNDS
  end
def round_done?
  @round_done
  end
def get_high_number
  print "I'll pick a number between 1 and what number? "
  high_number = @player.get_high_number
  if high_number <= 1
    puts "Oops! The number must be larger than 1. Try again."
    return false
  else
    return true
  end
end
def get_guess_count
  average = calculate_typical_number_of_guesses
  puts "How many guesses do you think it will take?"
  print "(average would be #{average}): "
  total_guess_count = @player.get_total_guess_count
  if total_guess_count < 1
    puts "Seriously #{@player.name}?!
    You need to at least try!"
    return false
  else
    return true
  end
end
def calculate_typical_number_of_guesses
  typical_count = Math.sqrt(@player.high_number)
  typical_count.round
end
def prepare_computer_number
  @computers_number = rand(@player.high_number) + 1
end
end

# Create the player class

class Player
  attr_reader :name, :score, :total_guess_count, :high_number,
  :current_guess, :current_number_of_guesses
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
def add_score(points)
  @score += points
  end
def get_high_number
  @high_number = gets.to_i
  end
def get_total_guess_count
  @total_guess_count = gets.to_i
  end
def get_guess
  @current_number_of_guesses += 1
  @current_guess = gets.to_i
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
