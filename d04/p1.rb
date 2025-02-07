def main
  if ARGV.empty?
    puts 'Missing input file'
    exit(1)
  end

  file_path = ARGV[0]
  pp solve(File.new(file_path, 'r'))
end

def solve(input_file)
  input = input_file.read

  rows, cols, anti_diags = [], [], []
  main_diags = {}
  input.each_line.with_index do |row, i_row|
    row.chomp.each_char.with_index do |char, i_col|
      rows[i_row] ||= ''
      rows[i_row] << char

      cols[i_col] ||= ''
      cols[i_col] << char

      i_main_diags = i_row - i_col
      main_diags[i_main_diags] ||= ''
      main_diags[i_main_diags] << char

      i_anti_diags = i_row + i_col
      anti_diags[i_anti_diags] ||= ''
      anti_diags[i_anti_diags] << char
    end
  end

  (rows + cols + main_diags.values + anti_diags).reduce(0) do |acc, s|
    acc + s.reverse.scan('XMAS').count + s.scan('XMAS').count
  end
end

main
