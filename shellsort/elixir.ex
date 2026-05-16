defmodule Shellsort do
    def shellsort(list) do
        arr = Enum.to_list(list)
        n = Enum.count(arr)
        shell_loop(arr, n div 2, n)
    end

    defp shell_loop(arr, gap, _) when gap <= 0, do: arr
    defp shell_loop(arr, gap, n) do
        new_arr = insert_gap(arr, gap, gap, n)
        shell_loop(new_arr, gap div 2, n)
    end

    defp insert_gap(arr, _, idx, n) when idx >= n, do: arr
    defp insert_gap(arr, gap, idx, n) when idx < gap do
        insert_gap(arr, gap, idx + 1, n)
    end
    defp insert_gap(arr, gap, idx, n) do
        temp = Enum.at(arr, idx)
        j = idx - gap
        if Enum.at(arr, j) > temp do
            new_arr = List.replace_at(arr, j + gap, Enum.at(arr, j))
            new_arr = List.replace_at(new_arr, j, temp)
            insert_gap(new_arr, gap, idx + 1, n)
        else
            insert_gap(arr, gap, idx + 1, n)
        end
    end
end
