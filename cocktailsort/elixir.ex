defmodule CocktailSort do
  def sort(list) do
    arr = List.to_tuple(list)
    n = tuple_size(arr)
    sorted = cocktail(arr, true, 0, n - 1)
    Tuple.to_list(sorted)
  end

  defp cocktail(arr, false, _, _), do: arr
  defp cocktail(arr, true, start, ending) do
    {arr1, sw1} = forward(arr, start, ending, false)
    if not sw1 do
      arr1
    else
      {arr2, sw2} = backward(arr1, start, ending - 2, false)
      cocktail(arr2, sw2, start + 1, ending - 1)
    end
  end

  defp forward(arr, i, ending, sw) when i >= ending, do: {arr, sw}
  defp forward(arr, i, ending, sw) do
    a = elem(arr, i)
    b = elem(arr, i + 1)
    if a > b do
      arr1 = arr |> put_elem(i, b) |> put_elem(i + 1, a)
      forward(arr1, i + 1, ending, true)
    else
      forward(arr, i + 1, ending, sw)
    end
  end

  defp backward(arr, start, i, sw) when i < start, do: {arr, sw}
  defp backward(arr, start, i, sw) do
    a = elem(arr, i)
    b = elem(arr, i + 1)
    if a > b do
      arr1 = arr |> put_elem(i, b) |> put_elem(i + 1, a)
      backward(arr1, start, i - 1, true)
    else
      backward(arr, start, i - 1, sw)
    end
  end
end
