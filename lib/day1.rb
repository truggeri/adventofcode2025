# frozen_string_literal: true

# Day 1 solution
module Day1
  module_function

  DIAL_SIZE = 100
  LEFT = 'L'

  def run
    input = read_input
    puts "Part 1: #{part1(input)}"
    puts "Part 2: #{part2(input)}"
  end

  def part1(input)
    count_zeros(input, count_during_rotation: false)
  end

  def part2(input)
    count_zeros(input, count_during_rotation: true)
  end

  def count_zeros(input, count_during_rotation:)
    rotations = parse_rotations(input)
    position = 50
    zero_count = 0

    rotations.each do |direction, distance|
      new_position = rotate(position, direction, distance)

      if count_during_rotation
        zero_count += count_zeros_in_range(position, distance, direction)
      elsif new_position.zero?
        zero_count += 1
      end

      position = new_position
    end

    zero_count
  end

  def rotate(position, direction, distance)
    move_down = direction == LEFT ? -1 : 1
    (position + (move_down * distance)) % DIAL_SIZE
  end

  def parse_rotations(input)
    input.lines.map do |line|
      direction = line[0]
      distance = line[1..].to_i
      [direction, distance]
    end
  end

  def count_zeros_in_range(start_pos, distance, direction)
    complete_loops = distance / DIAL_SIZE
    zero_count = complete_loops
    remaining = distance % DIAL_SIZE

    if direction == LEFT
      zero_count += 1 if start_pos.positive? && (start_pos - remaining) <= 0
    elsif (start_pos + remaining) >= DIAL_SIZE # :right
      zero_count += 1
    end

    zero_count
  end

  def read_input
    File.read('inputs/day1.txt').strip
  end
end
