def gnome_sort(arr:int[]):int[]
    i = 0
    n = arr.length
    while i < n
        if i == 0 || arr[i] >= arr[i - 1]
            i += 1
        else
            tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i -= 1
        end
    end
    arr
end
