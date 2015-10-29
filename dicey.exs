
dice_num = fn ->
  # create a list of integers [1..6], and convert to a string

  :crypto.rand_bytes(5)
  |> :binary.bin_to_list
  |> Enum.map( &( round(&1 / 256 * 5) + 1 ) )
  |> Enum.join
end

# (1..1000) |> Enum.each(fn _x ->
# 	if dice_num.() =~ ~r/[^123456/} do
# 		IO.puts "error: dice_num returned value outside range 1..6"
# 	end
# end)

{:ok, file_text} = File.read("wordlist.diceware.asc")
lines = String.split(file_text, ~r{\R})
dictionary_lines = Enum.filter(lines, &( &1 =~ ~r/^\d{5}/ ))

key_list = Enum.map(dictionary_lines, fn line ->
	[k, v] = String.split(line, "\t")
	k = String.to_atom(k)
	{k, v}
end)

num = dice_num.()
key = String.to_atom(num)
IO.puts( num <> " -> " <> key_list[key] )
