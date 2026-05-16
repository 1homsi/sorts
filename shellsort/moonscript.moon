shell_sort = (arr) ->
    n = #arr
    gap = math.floor n / 2
    while gap > 0
        for i = gap + 1, n
            temp = arr[i]
            j = i
            while j > gap and arr[j - gap] > temp
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
        gap = math.floor gap / 2
    arr

arr = {64, 34, 25, 12, 22, 11, 90}
result = shell_sort arr
print table.concat result, " "
