{:ok, contents} = File.read("./advent/day_1/inputs.txt")

number = String.split(contents, "\n")
|> Enum.reduce(0, fn content, acc ->
  codepoint_list = String.codepoints(content)
  |> Enum.filter(fn codepoint ->
    case Integer.parse(codepoint, 10) do
      {_int, ""} -> true
      :error -> false
    end
  end)

  first = List.first(codepoint_list)
  last  = List.last(codepoint_list)
  content_sum = first <> last |> String.to_integer

  acc + content_sum
end)

IO.puts(number)
