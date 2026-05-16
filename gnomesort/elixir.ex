defmodule GnomeSort do
  def sort(list) do
    arr = List.to_tuple(list)
    sorted = loop(arr, 0, tuple_size(arr))
    Tuple.to_list(sorted)
  end

  defp loop(arr, i, n) when i >= n, do: arr
  defp loop(arr, 0, n), do: loop(arr, 1, n)
  defp loop(arr, i, n) do
    a = elem(arr, i - 1)
    b = elem(arr, i)
    if b >= a do
      loop(arr, i + 1, n)
    else
      arr2 = arr |> put_elem(i - 1, b) |> put_elem(i, a)
      loop(arr2, i - 1, n)
    end
  end
end
