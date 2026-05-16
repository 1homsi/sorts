fn comb_sort(inout arr: DynamicVector[Int]):
    let n = len(arr)
    var gap = n
    var sorted = False
    while not sorted:
        gap = int(gap / 1.3)
        if gap <= 1:
            gap = 1
            sorted = True
        var i = 0
        while i + gap < n:
            if arr[i] > arr[i + gap]:
                let tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = False
            i += 1
