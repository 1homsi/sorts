def shell_sort: arr {
    n = arr size
    gap = n / 2
    { gap > 0 } while_true: {
        gap upto: n - 1 do: |i| {
            temp = arr[i]
            j = i
            { (j >= gap) && (arr[j - gap] > temp) } while_true: {
                arr[j] = arr[j - gap]
                j = j - gap
            }
            arr[j] = temp
        }
        gap = gap / 2
    }
    arr
}

arr = [64, 34, 25, 12, 22, 11, 90]
shell_sort: arr . println
