def gnome_sort(arr):
    let n = length(arr)
    var i = 0
    while i < n:
        if i == 0 or arr[i] >= arr[i - 1]:
            i++
        else:
            let tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i--
    arr
