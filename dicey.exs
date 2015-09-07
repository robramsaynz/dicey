
dice_num = fn ->
  # create a list of integers [1..6], and convert to a string

  :crypto.rand_bytes(5)
  |> :binary.bin_to_list
  |> Enum.map( &( round(&1 / 256 * 5) + 1 ) )
  |> Enum.join
end

{:ok, file_text} = File.read("diceware.wordlist.asc")
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