defmodule CombSort do
  def sort(list) do
    arr = List.to_tuple(list)
    n = tuple_size(arr)
    result = loop(arr, n, n)
    Tuple.to_list(result)
  end

  defp loop(arr, n, gap) do
    new_gap = max(1, trunc(gap / 1.3))
    {new_arr, changed} = pass(arr, n, new_gap, 0, false)
    if new_gap == 1 and not changed do
      new_arr
    else
      loop(new_arr, n, new_gap)
    end
  end

  defp pass(arr, n, gap, i, changed) when i + gap >= n, do: {arr, changed}
  defp pass(arr, n, gap, i, changed) do
    a = elem(arr, i)
    b = elem(arr, i + gap)
    if a > b do
      new_arr = arr |> put_elem(i, b) |> put_elem(i + gap, a)
      pass(new_arr, n, gap, i + 1, true)
    else
      pass(arr, n, gap, i + 1, changed)
    end
  end
end
