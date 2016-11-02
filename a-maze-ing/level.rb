require 'gosu'
require_relative 'tile'
require_relative 'player'

class Level
  def initialize(window, player, level_data)
    @window = window
    @tiles = []
    @player = player
    @level_data = level_data
    @total_rows = 0
    @total_columns = 0
    @exit_reached = false
    if @level_data
      @total_rows = @level_data.length
      if @total_rows > 0
        @total_columns = @level_data.first.length
      end
      setup_level
    end
  end

  def setup_level
    @level_data.each_with_index do |row_data, row|
      column = 0
      row_data.each_char do |cell_type|
        tile = Tile.new(@window, column, row, cell_type)
        # change behavior depending on cell_type
        if tile.is_start?
          @player.move_to(column, row)
        end
        @tiles.push(tile)
        column += 1
      end
    end
  end

  def button_down(id)
    if level_over?
      return
    end
    column_delta = 0
    row_delta = 0
    if id == Gosu::KbLeft
      column_delta = -1
    elsif id == Gosu::KbRight
      column_delta = 1
    end
    if id == Gosu::KbUp
      row_delta = -1
    elsif id == Gosu::KbDown
      row_delta = 1
    end
    if move_valid?(@player, column_delta, row_delta)
      @player.move_by(column_delta, row_delta)
      tile = get_tile(@player.column, @player.row)
      if tile.is_exit?
        @exit_reached = true
        tile.hide!
      else
        @player.pick_up(tile)
      end
    end
  end

  def update
  end

  def draw
  end

end
