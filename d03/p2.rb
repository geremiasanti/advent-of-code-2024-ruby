# frozen_string_literal: true

def main
  if ARGV.empty?
    puts 'Missing input file'
    exit(1)
  end

  file_path = ARGV[0]
  pp solve(File.new(file_path, 'r'))
end

def solve(input_file)
  puts txt_content = input_file.read

  enabled = true
  txt_content
    .scan(/do\(\)|don't\(\)|mul\([0-9]{1,3},[0-9]{1,3}\)/)
    .reduce(0) { |acc, instruction|
      if instruction == 'do()' 
        enabled = true
        next acc
      end
      if instruction == 'don\'t()'
        enabled = false
        next acc
      end
      next acc if !enabled

      p1, p2 = instruction.scan(/[0-9]{1,3}/).map(&:to_i)
      acc + p1 * p2
    }
end

main
