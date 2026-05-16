defmodule BubbleSort do
  def sort(list) do
    {sorted, swapped} = pass(list, false)
    if swapped, do: sort(sorted), else: sorted
  end

  defp pass([], swapped), do: {[], swapped}
  defp pass([x], swapped), do: {[x], swapped}
  defp pass([x, y | rest], _) when x > y do
    {sorted, _} = pass([x | rest], true)
    {[y | sorted], true}
  end
  defp pass([x | rest], swapped) do
    {sorted, s} = pass(rest, swapped)
    {[x | sorted], s}
  end
end

arr = [64, 34, 25, 12, 22, 11, 90]
IO.inspect(BubbleSort.sort(arr))
