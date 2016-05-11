#
# Ruby For Kids Project 8: Code Breaker
# Tutorial By: Chris Haupt
# Programmed By: Kyrene Jackson
# A program that will encrypt and decrypt another
# document using the Ceaser cipher.
# Program Skeleton
# - A main object will manage the user interface
# and input and output of files to be encrypted
# and decrypted.
# - A second object will contain the code for
# the encryption process itself.
# - This programs version of the Ceaser Cipher
# will use a lookup table technique organized
# in a hash.
#======================================================



# Create Ceaser class
class Ceaser
  #code goes here
end



# declare array constant that will represent the
# values of program commands
COMMANDS = ['e', 'd']
# Create the CodeBreaker class
# use empty quotes to signify no filename has been selected
# note: ruby unlike most languages count empty strings as being 'true'
class CodeBreaker
  def initialize
    @input_file = ''
    @output_file = ''
    @password = ''
  end
  def run
    if get_command && get_input_file && get_output_file && get_secret
      process_files
      true
    else
      false
    end
  end
    def get_command
      print "Do you want to (e)ncrypt or (d)ecrypt a file? "
      @command = gets.chomp.downcase
      if !COMMANDS.include?(@command)
        puts "Unknown command, sorry!"
        return false
      end
      true
    end
    def get_input_file
      print "Enter the name of the input file: "
      @input_file = gets.chomp
      # Check to see if the file exists
      if !File.exists?(@input_file)
        puts "Can't find the input file, sorry!"
        return false
      end
      true
  end
  def get_output_file
    print "Enter the name of the output file: "
    @output_file = gets.chomp
    if File.exists?(@output_file)
      puts "The output file already exists, can't overwrite"
      return false
    end
    true
  end
  def get_secret
    print "Enter the secret password: "
    @password = gets.chomp
  end 
end









# welcome message to display to user once program is opened
puts "Code Brekaer will encrypt or decrypt a file of your choice"
puts ""

# new CodeBreaker class instance
codebreaker = CodeBreaker.new

# status of whether or not the program worked properly
if codebreaker.run
  puts "All done!"
else
  puts "Didn't work!"
end
