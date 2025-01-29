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
  txt_content.scan(/mul\([0-9]{1,3},[0-9]{1,3}\)/)
    .map { |instruction| instruction.scan(/[0-9]{1,3}/).map(&:to_i) }
    .reduce(0) { |acc, (p1, p2)| acc + p1 * p2 }
end

main
