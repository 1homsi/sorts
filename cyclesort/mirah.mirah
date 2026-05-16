def cycleSort(arr:int[]):int
    n = arr.length
    writes = 0
    cycleStart = 0
    while cycleStart < n - 1
        item = arr[cycleStart]
        pos = cycleStart
        i = cycleStart + 1
        while i < n
            if arr[i] < item then pos += 1 end
            i += 1
        end
        if pos != cycleStart
            while item == arr[pos]
                pos += 1
            end
            tmp = arr[pos]; arr[pos] = item; item = tmp
            writes += 1
            while pos != cycleStart
                pos = cycleStart
                i = cycleStart + 1
                while i < n
                    if arr[i] < item then pos += 1 end
                    i += 1
                end
                while item == arr[pos]
                    pos += 1
                end
                tmp = arr[pos]; arr[pos] = item; item = tmp
                writes += 1
            end
        end
        cycleStart += 1
    end
    writes
end

arr = int[]{5, 4, 3, 2, 1}
cycleSort(arr)
puts arr.to_s
