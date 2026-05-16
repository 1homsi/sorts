def gnome_sort: arr {
    i = 0
    n = arr size
    { i < n } while_true: {
        { i == 0 || (arr[i] >= arr[i - 1]) } if_true: {
            i = i + 1
        } else: {
            tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i = i - 1
        }
    }
    arr
}
