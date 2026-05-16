defmodule ShellSort do
  def sort(list) do
    arr = List.to_tuple(list)
    n = tuple_size(arr)
    sorted = do_sort(arr, n, div(n, 2))
    Tuple.to_list(sorted)
  end

  defp do_sort(arr, _n, 0), do: arr
  defp do_sort(arr, n, gap) do
    arr2 = Enum.reduce(gap..(n - 1), arr, fn i, a ->
      temp = elem(a, i)
      shift_back(a, gap, i, temp)
    end)
    do_sort(arr2, n, div(gap, 2))
  end

  defp shift_back(arr, gap, j, temp) when j < gap do
    put_elem(arr, j, temp)
  end
  defp shift_back(arr, gap, j, temp) do
    prev = elem(arr, j - gap)
    if prev > temp do
      arr2 = put_elem(arr, j, prev)
      shift_back(arr2, gap, j - gap, temp)
    else
      put_elem(arr, j, temp)
    end
  end
end

arr = [64, 34, 25, 12, 22, 11, 90]
IO.inspect(ShellSort.sort(arr))
