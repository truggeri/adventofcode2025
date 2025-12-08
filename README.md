# Advent of Code 2025

Ruby solutions for [Advent of Code 2025](https://adventofcode.com/2025).

## Project Structure

```
.
├── lib/          # Solution modules (day1.rb - day25.rb)
├── spec/         # RSpec tests (day1_spec.rb - day25_spec.rb)
├── inputs/       # Puzzle inputs (day1.txt - day25.txt)
├── Gemfile       # Ruby dependencies
├── Rakefile      # Rake tasks
└── README.md     # This file
```

## Setup

Install dependencies:

```bash
bundle install
```

## Usage

### Running a specific day

```bash
rake run[1]    # Run day 1
rake run[15]   # Run day 15
```

### Running tests

```bash
bundle exec rspec              # Run all tests
bundle exec rspec spec/day1_spec.rb   # Run specific day tests
```

## Adding Solutions

1. Add your puzzle input to `inputs/dayX.txt`
2. Implement `part1` and `part2` methods in `lib/dayX.rb`
3. Update tests in `spec/dayX_spec.rb` with sample inputs and expected results
4. Run tests with `bundle exec rspec spec/dayX_spec.rb`
5. Run your solution with `rake run[X]`

## Day Structure

Each day module follows this structure:

```ruby
module DayX
  module_function

  def run
    input = read_input
    puts "Part 1: #{part1(input)}"
    puts "Part 2: #{part2(input)}"
  end

  def part1(input)
    # Your solution here
  end

  def part2(input)
    # Your solution here
  end

  def read_input
    File.read("inputs/dayX.txt").strip
  end
end
```
