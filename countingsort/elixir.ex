defmodule CountingSort do
  def sort([]), do: []
  def sort(arr) do
    max = Enum.max(arr)
    min = Enum.min(arr)
    range = max - min + 1
    count = Enum.reduce(arr, List.duplicate(0, range), fn x, acc ->
      List.update_at(acc, x - min, &(&1 + 1))
    end)
    count = Enum.reduce(1..(range - 1), count, fn i, acc ->
      List.update_at(acc, i, &(&1 + Enum.at(acc, i - 1)))
    end)
    output = List.duplicate(0, length(arr))
    {output, _} = Enum.reduce(Enum.reverse(arr), {output, count}, fn x, {out, cnt} ->
      i = x - min
      pos = Enum.at(cnt, i) - 1
      {List.replace_at(out, pos, x), List.replace_at(cnt, i, pos)}
    end)
    output
  end
end

IO.inspect(CountingSort.sort([4, 2, 2, 8, 3, 3, 1]))
