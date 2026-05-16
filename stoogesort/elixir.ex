defmodule StoogeSort do
    def sort(arr) do
        a = List.to_tuple(arr)
    sorted = stooge_sort(a, 0, tuple_size(a) - 1)
    Tuple.to_list(sorted)
    end

    def stooge_sort(arr, first, last) do
    a = elem(arr, first)
    b = elem(arr, last)
    arr = if a > b do
        arr |> put_elem(first, b) |> put_elem(last, a)
    else
        arr
    end
    n = last - first + 1
    if n > 2 do
        t = div(n * 2, 3)
        arr = stooge_sort(arr, first, first + t - 1)
        arr = stooge_sort(arr, last - t + 1, last)
        stooge_sort(arr, first, first + t - 1)
    else
        arr
    end
    end
end

IO.inspect StoogeSort.sort([3, 1, 4, 1, 5, 9, 2, 6])
