defmodule PancakeSort do
  def flip(arr, k) do
    {front, back} = Enum.split(arr, k + 1)
    Enum.reverse(front) ++ back
  end

  def find_max_idx(arr, size) do
    sub = Enum.take(arr, size)
    max_val = Enum.max(sub)
    Enum.find_index(sub, fn x -> x == max_val end)
  end

  def sort(arr, 1), do: arr
  def sort(arr, size) do
    max_idx = find_max_idx(arr, size)
    a1 = if max_idx != 0, do: flip(arr, max_idx), else: arr
    a2 = flip(a1, size - 1)
    sort(a2, size - 1)
  end

  def pancake_sort(arr), do: sort(arr, length(arr))
end

IO.inspect PancakeSort.pancake_sort([3, 6, 2, 7, 4, 1, 5])
