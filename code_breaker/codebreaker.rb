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

# welcome message to display to user once program is opened
puts "Code Brekaer will encrypt or decrypt a file of your choice"
puts " "

# new CodeBreaker class instance
codebreaker = CodeBreaker.new

# status of whether or not the program worked properly
if codebreaker.run
  puts "All done!"
else
  puts "Didn't work!"
end
