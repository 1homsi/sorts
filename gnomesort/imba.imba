def gnomeSort arr
    let i = 0
    let n = arr.length
    while i < n
        if i == 0 or arr[i] >= arr[i - 1]
            i++
        else
            let tmp = arr[i]
            arr[i] = arr[i - 1]
            arr[i - 1] = tmp
            i--
    return arr
