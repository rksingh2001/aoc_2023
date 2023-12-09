file_path = "1.txt"

file_stream = File.stream!(file_path)

sol =
  Enum.reduce(file_stream, 0, fn line, acc ->
    line = String.to_charlist(line)
    nums = Enum.filter(line, fn char -> char in ?0..?9 end)
    first_num = hd(nums)
    nums = Enum.reverse(nums)
    last_num = hd(nums)
    num = List.to_integer([first_num, last_num])
    num + acc
  end)

IO.puts(sol)
