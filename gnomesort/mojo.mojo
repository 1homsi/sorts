fn gnome_sort(inout arr: DynamicVector[Int]):
    var i = 0
    let n = len(arr)
    while i < n:
        if i == 0 or arr[i] >= arr[i - 1]:
            i += 1
        else:
            let tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i -= 1
