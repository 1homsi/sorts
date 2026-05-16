def combSort(arr:int[]):int[]
    n = arr.length
    gap = n
    sorted = false
    while !sorted
        gap = int(gap / 1.3)
        if gap <= 1
            gap = 1
            sorted = true
        end
        i = 0
        while i + gap < n
            if arr[i] > arr[i + gap]
                tmp = arr[i]
                arr[i] = arr[i + gap]
                arr[i + gap] = tmp
                sorted = false
            end
            i += 1
        end
    end
    arr
end
