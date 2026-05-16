defmodule MergeSort do
  def sort([]), do: []
  def sort([x]), do: [x]
  def sort(list) do
    mid = div(length(list), 2)
    left = Enum.take(list, mid)
    right = Enum.drop(list, mid)
    merge(sort(left), sort(right))
  end

  def merge([], right), do: right
  def merge(left, []), do: left
  def merge([lh | lt], [rh | rt]) when lh <= rh do
    [lh | merge(lt, [rh | rt])]
  end
  def merge([lh | lt], [rh | rt]) do
    [rh | merge([lh | lt], rt)]
  end
end

IO.inspect MergeSort.sort([38, 27, 43, 3, 9, 82, 10])
