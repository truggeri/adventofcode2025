# frozen_string_literal: true

# Day 1 solution
module Day1
  module_function

  def run
    input = read_input
    puts "Part 1: #{part1(input)}"
    puts "Part 2: #{part2(input)}"
  end

  def part1(input)
    rotations = parse_rotations(input)
    position = 50
    zero_count = 0

    rotations.each do |direction, distance|
      if direction == 'L'
        position = (position - distance) % 100
      else # direction == 'R'
        position = (position + distance) % 100
      end
      zero_count += 1 if position == 0
    end

    zero_count
  end

  def parse_rotations(input)
    input.lines.map do |line|
      direction = line[0]
      distance = line[1..].to_i
      [direction, distance]
    end
  end

  def part2(input)
    rotations = parse_rotations(input)
    position = 50
    zero_count = 0

    rotations.each do |direction, distance|
      # Count how many times we pass through 0 during this rotation
      if direction == 'L'
        # Moving left (decreasing)
        new_position = (position - distance) % 100
        # Count complete wraps plus any crossing of 0
        zero_count += count_zeros_in_range(position, new_position, distance, :left)
        position = new_position
      else # direction == 'R'
        # Moving right (increasing)
        new_position = (position + distance) % 100
        # Count complete wraps plus any crossing of 0
        zero_count += count_zeros_in_range(position, new_position, distance, :right)
        position = new_position
      end
    end

    zero_count
  end

  def count_zeros_in_range(start_pos, end_pos, distance, direction)
    complete_loops = distance / 100
    zero_count = complete_loops
    remaining = distance % 100
    
    if direction == :left
      zero_count += 1 if start_pos.positive? && (start_pos - remaining) <= 0
    else # :right
      zero_count += 1 if (start_pos + remaining) >= 100
    end

    zero_count
  end

  def read_input
    File.read("inputs/day1.txt").strip
  end
end
