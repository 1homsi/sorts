defmodule RadixSort do
  def counting_sort(arr, exp) do
    arr
    |> Enum.reduce(Enum.map(0..9, fn _ -> [] end), fn x, buckets ->
      idx = rem(div(x, exp), 10)
      List.update_at(buckets, idx, &(&1 ++ [x]))
    end)
    |> Enum.concat()
  end

  def radix_sort([]), do: []
  def radix_sort(arr) do
    max = Enum.max(arr)
    Stream.iterate(1, &(&1 * 10))
    |> Enum.take_while(&(div(max, &1) > 0))
    |> Enum.reduce(arr, &counting_sort(&2, &1))
  end
end

IO.inspect(RadixSort.radix_sort([170, 45, 75, 90, 802, 24, 2, 66]))
