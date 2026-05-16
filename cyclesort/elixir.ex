defmodule CycleSort do
  def sort(list) do
    arr = :array.from_list(list)
    n = :array.size(arr)
    arr2 = do_sort(arr, n, 0)
    :array.to_list(arr2)
  end

  defp do_sort(arr, n, cycle_start) when cycle_start >= n - 1, do: arr
  defp do_sort(arr, n, cycle_start) do
    item = :array.get(cycle_start, arr)
    pos = count_smaller(arr, n, cycle_start + 1, item, cycle_start)
    if pos == cycle_start do
      do_sort(arr, n, cycle_start + 1)
    else
      pos2 = skip_dups(arr, pos, item)
      val = :array.get(pos2, arr)
      arr2 = :array.set(pos2, item, arr)
      {arr3, _} = do_cycle(arr2, n, cycle_start, val, pos2)
      do_sort(arr3, n, cycle_start + 1)
    end
  end

  defp count_smaller(_arr, n, i, _item, pos) when i >= n, do: pos
  defp count_smaller(arr, n, i, item, pos) do
    v = :array.get(i, arr)
    new_pos = if v < item, do: pos + 1, else: pos
    count_smaller(arr, n, i + 1, item, new_pos)
  end

  defp skip_dups(arr, pos, item) do
    if :array.get(pos, arr) == item, do: skip_dups(arr, pos + 1, item), else: pos
  end

  defp do_cycle(arr, _n, cycle_start, item, pos) when pos == cycle_start, do: {arr, item}
  defp do_cycle(arr, n, cycle_start, item, _pos) do
    pos2 = count_smaller(arr, n, cycle_start + 1, item, cycle_start)
    pos3 = skip_dups(arr, pos2, item)
    val = :array.get(pos3, arr)
    arr2 = :array.set(pos3, item, arr)
    do_cycle(arr2, n, cycle_start, val, pos3)
  end
end

IO.inspect CycleSort.sort([5, 4, 3, 2, 1])
