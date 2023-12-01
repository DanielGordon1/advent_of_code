# Mapping words to their numeric representations
word_to_number = {
  'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5,
  'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9
}

def extract_digits(line, word_to_number)
  digits = line.scan(/\d+|one|two|three|four|five|six|seven|eight|nine/).map do |token|
    if token.match?(/\d+/)
      token.to_i
    else
      word_to_number[token]
    end
  end

  first_digit = digits.find { |d| d.is_a?(Integer) }
  last_digit = digits.reverse.find { |d| d.is_a?(Integer) }

  [first_digit.to_s.split('')[0], last_digit.to_s.split('')[-1]]
end

file_path = './data.txt'

File.open(file_path, 'r') do |file|
  sum = 0
  file.each_line do |line|
    first_digit, last_digit = extract_digits(line, word_to_number)
    number = "#{first_digit}#{last_digit}"
    puts "Line: #{line.chomp}" # chomp removes the newline character
    puts "First Digit: #{first_digit}"
    puts "Last Digit: #{last_digit}"
    puts "Number: #{number}"
    puts "---------------------"
    
    sum += "#{first_digit}#{last_digit}".to_i
  end
  puts "Sum: #{sum}"
end
