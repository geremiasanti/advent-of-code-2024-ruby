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
  input_file.readlines
    .map { |l| l.split.map(&:to_i) }
    .count do |report|
      safe = safe? report
      next safe if safe

      report_copies_with_one_level_removed = report.map.with_index do |_, i_to_remove|
        report.reject.with_index { |_, i| i == i_to_remove }
      end

      report_copies_with_one_level_removed.any? { |r| safe? r }
    end
end

def safe?(report)
  is_incrementing = nil
  report.each_cons(2) do |l1, l2|
    inc = l2 - l1

    is_incrementing = inc.positive? if is_incrementing.nil?

    break false if inc.positive? != is_incrementing
    break false if inc.zero? || inc.abs > 3
    true
  end
end

main
