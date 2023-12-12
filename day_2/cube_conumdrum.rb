def part_one(lines)
  lines.map do |line|
    game_id = line[/\d+/].to_i
    counts = { "blue" => 0, "green" => 0, "red" => 0 }
    line.split(": ").last.split(/[;,] /).each do |c|
      count, color = c.split(" ")
      counts[color] = count.to_i if counts[color] < count.to_i
    end

    counts["red"] <= 12 && counts["green"] <= 13 && counts["blue"] <= 14 ? game_id : 0
  end.sum
end
puts part_one(File.read('data.txt').lines)


def part_two(lines)
  lines.map do |line|
    counts = { "blue" => 0, "green" => 0, "red" => 0 }
    line.split(": ").last.split(/[;,] /).each do |c|
      count, color = c.split(" ")
      counts[color] = count.to_i if counts[color] < count.to_i
    end

    counts.values.reduce(1, &:*)
  end.sum
end
puts part_two(File.read('data.txt').lines)
