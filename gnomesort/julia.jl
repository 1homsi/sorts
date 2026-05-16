function gnome_sort!(arr)
    i = 1
    n = length(arr)
    while i <= n
        if i == 1 || arr[i] >= arr[i-1]
            i += 1
        else
            arr[i], arr[i-1] = arr[i-1], arr[i]
            i -= 1
        end
    end
    arr
end
