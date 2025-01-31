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
  puts input = input_file.read
  input.split("\n")
end

main
