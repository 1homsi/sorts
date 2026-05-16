defmodule Bogosort do
  def is_sorted([]), do: true
  def is_sorted([_]), do: true
  def is_sorted([a, b | rest]) when a <= b, do: is_sorted([b | rest])
  def is_sorted(_), do: false

  def bogosort(arr) do
    if is_sorted(arr) do
      arr
    else
      arr |> Enum.shuffle() |> bogosort()
    end
  end
end

arr = [3, 1, 4, 1, 5, 9, 2, 6]
IO.inspect(Bogosort.bogosort(arr))
