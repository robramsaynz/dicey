
dicey = fn ->
  :crypto.rand_bytes(5)
  |> :binary.bin_to_list
  |> Enum.map( &( round &1 / 256 * 7 ) )
  |> Enum.join
end

IO.puts dicey.()


