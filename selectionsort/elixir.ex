defmodule SelectionSort do
  def sort([]), do: []
  def sort(list) do
    min = Enum.min(list)
    rest = List.delete(list, min)
    [min | sort(rest)]
  end
end
