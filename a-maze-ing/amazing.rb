
#
# Ruby For Kids Project 10: A-maze-ing
# Tutorial By: Chris Haupt
# Programmed By: Kyrene Jackson
# A mazelike treasure search game
#
# To run the program, use:
# ruby amazing.rb
#
#=======================================================

require 'gosu'

class Amazing < Gosu::Window
def initialize
    super(640, 640)
    self.caption = "Amazing"
    # more code will go here
  end
  # even more code will go here
end
window = Amazing.new
window.show
