defmodule BitonicSort do
  def compare_and_swap(a, b, dir) do
    if dir == a > b, do: {b, a}, else: {a, b}
  end

  def bitonic_merge([], _dir), do: []
  def bitonic_merge([x], _dir), do: [x]
  def bitonic_merge(xs, dir) do
    n = length(xs)
    k = div(n, 2)
    left = Enum.take(xs, k)
    right = Enum.drop(xs, k)
    paired = Enum.zip(left, right) |> Enum.map(fn {a, b} -> compare_and_swap(a, b, dir) end)
    new_left = Enum.map(paired, &elem(&1, 0))
    new_right = Enum.map(paired, &elem(&1, 1))
    bitonic_merge(new_left, dir) ++ bitonic_merge(new_right, dir)
  end

  def bitonic_sort([], _dir), do: []
  def bitonic_sort([x], _dir), do: [x]
  def bitonic_sort(xs, dir) do
    n = length(xs)
    k = div(n, 2)
    left = Enum.take(xs, k)
    right = Enum.drop(xs, k)
    sorted_left = bitonic_sort(left, true)
    sorted_right = bitonic_sort(right, false)
    bitonic_merge(sorted_left ++ sorted_right, dir)
  end
end

data = [3, 7, 4, 8, 6, 2, 1, 5]
IO.inspect(BitonicSort.bitonic_sort(data, true))
