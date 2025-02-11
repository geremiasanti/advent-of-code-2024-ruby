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
  left_line, right_line = input_file.readlines.map { |l| l.split.map(&:to_i) }
                                    .flatten
                                    .partition.with_index { |_, i| i.even? }
                                    .map(&:sort)

  left_line.zip(right_line).reduce(0) { |distances_sum, (l, r)| distances_sum + (l - r).abs }
end

main
