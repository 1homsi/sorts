defmodule Heapsort do
  def heapify(arr, n, i) do
    left = 2 * i + 1
    right = 2 * i + 2
    largest0 = if left < n and Enum.at(arr, left) > Enum.at(arr, i), do: left, else: i
    largest = if right < n and Enum.at(arr, right) > Enum.at(arr, largest0), do: right, else: largest0
    if largest != i do
      arr = swap(arr, i, largest)
      heapify(arr, n, largest)
    else
      arr
    end
  end

  def swap(arr, i, j) do
    vi = Enum.at(arr, i)
    vj = Enum.at(arr, j)
    arr |> List.replace_at(i, vj) |> List.replace_at(j, vi)
  end

  def heapsort(arr) do
    n = length(arr)
    arr = Enum.reduce((div(n, 2) - 1)..0//-1, arr, fn i, a -> heapify(a, n, i) end)
    Enum.reduce((n - 1)..1//-1, arr, fn i, a ->
      a = swap(a, 0, i)
      heapify(a, i, 0)
    end)
  end
end

arr = [12, 11, 13, 5, 6, 7]
IO.inspect(Heapsort.heapsort(arr))
