# frozen_string_literal
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
  input_file.readlines.map { |l| l.split.map(&:to_i) }
    # convert report value to report increments
    .map { |r| r.each_cons(2).map { |l1, l2| l2 - l1 } }
    # count safe reports
    .count do |r|
      next false if r.any? { |l| l.abs > 3 }

      increments = r.count(&:positive?)
      next false if !increments.zero? && increments < r.size

      decrements = r.count(&:negative?)
      next false if !decrements.zero? && decrements < r.size

      true
    end
end

main
