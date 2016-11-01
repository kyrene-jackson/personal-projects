
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
require_relative 'game'

class Amazing < Gosu::Window
  def initialize
    super(640, 640)
    self.caption = "Amazing"
    @game = Game.new(self)
  end
  def update
    @game.update
  end
  def draw
    @game.draw
  end
  def button_down(id)
    @game.button_down(id)
  end
end
window = Amazing.new
window.show
