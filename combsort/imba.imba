def combSort arr
    let n = arr.length
    var gap = n
    var sorted = false
    while !sorted
        gap = Math.floor(gap / 1.3)
        if gap <= 1
            gap = 1
            sorted = true
        for i in [0...n - gap]
            if arr[i] > arr[i + gap]
                let tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
    arr
