defmodule TimSort do
  @min_run 32

  def insertion_sort([]), do: []
  def insertion_sort([h | t]), do: insert(h, insertion_sort(t))

  defp insert(x, []), do: [x]
  defp insert(x, [h | t]) when x <= h, do: [x, h | t]
  defp insert(x, [h | t]), do: [h | insert(x, t)]

  def merge([], ys), do: ys
  def merge(xs, []), do: xs
  def merge([x | xs], [y | ys]) when x <= y, do: [x | merge(xs, [y | ys])]
  def merge([x | xs], [y | ys]), do: [y | merge([x | xs], ys)]

  defp chunks(_, []), do: []
  defp chunks(n, xs) do
    {chunk, rest} = Enum.split(xs, n)
    [chunk | chunks(n, rest)]
  end

  defp merge_pairs([]), do: []
  defp merge_pairs([x]), do: [x]
  defp merge_pairs([x, y | rest]), do: [merge(x, y) | merge_pairs(rest)]

  defp merge_all([x]), do: x
  defp merge_all(xs), do: merge_all(merge_pairs(xs))

  def timsort([]), do: []
  def timsort(xs) do
    runs = xs |> chunks(@min_run) |> Enum.map(&insertion_sort/1)
    merge_all(runs)
  end
end
