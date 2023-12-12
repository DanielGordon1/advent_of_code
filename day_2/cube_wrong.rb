class CubeSolver
  RED = 12
  GREEN = 13
  BLUE = 14

  S_RED = 'red'
  S_GREEN = 'green'
  S_BLUE = 'blue'

  VALID_AMOUNTS = {
    'red' => RED,
    'green' => GREEN,
    'blue' => BLUE
  }

  def self.valid_amount?(col_val)
    arr = col_val.split(' ').map(&:strip)
    arr[0].to_i <= VALID_AMOUNTS[arr[1]]
  end

  def self.call
    possible_game_ids = []

    # Read the file line by line
    File.foreach('data.txt') do |line|
      valid = true 
      valid_game = []
      # Split the line by ';' to separate each column
      columns = line.split(';')

      # Extract the game number from the first column
      game_number = columns.shift.match(/(\d+):/)[1]
      
      # Process each column further by splitting it by ':'
      columns.each_with_index do |column, index|
        # Remove any leading/trailing spaces
        column = column.strip

        # Clean and display data
        valid_game << column.split(',').all? do |col_val| 
          valid_amount?(col_val) 
        end
        # puts "Game #{game_number}, Column #{index + 1}: #{column}"
      end
      possible_game_ids << game_number.to_i if valid_game.all?
    end
    possible_game_ids.sum
  end
end
