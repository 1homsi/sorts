defmodule Quicksort do
  def sort([]), do: []
  def sort([pivot | rest]) do
    left = Enum.filter(rest, &(&1 <= pivot))
    right = Enum.filter(rest, &(&1 > pivot))
    sort(left) ++ [pivot] ++ sort(right)
  end
end

IO.inspect Quicksort.sort([3, 6, 8, 10, 1, 2, 1])
