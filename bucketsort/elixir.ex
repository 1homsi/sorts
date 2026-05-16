defmodule BucketSort do
  def insertion_sort([]), do: []
  def insertion_sort([h | t]), do: insert(h, insertion_sort(t))

  defp insert(x, []), do: [x]
  defp insert(x, [h | t]) when x <= h, do: [x, h | t]
  defp insert(x, [h | t]), do: [h | insert(x, t)]

  def bucket_sort([]), do: []
  def bucket_sort(arr) do
    n = length(arr)
    min = Enum.min(arr)
    max = Enum.max(arr)
    buckets = Enum.reduce(arr, List.duplicate([], n), fn x, bs ->
      idx = min(n - 1, trunc((x - min) / (max - min + 1) * n))
      List.update_at(bs, idx, &(&1 ++ [x]))
    end)
    Enum.flat_map(buckets, &insertion_sort/1)
  end
end

IO.inspect BucketSort.bucket_sort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68])
