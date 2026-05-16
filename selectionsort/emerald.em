object SelectionSort
    export operation sort[arr: Array[Integer]] -> Array[Integer]
        var n: Integer <- arr.size
        for var i: Integer <- 0 while i < n-1 by i <- i + 1 do
            var minIdx: Integer <- i
            for var j: Integer <- i+1 while j < n by j <- j + 1 do
                if arr[j] < arr[minIdx] then minIdx <- j end
            end
            var tmp: Integer <- arr[i]
            arr[i] <- arr[minIdx]
            arr[minIdx] <- tmp
        end
        return arr
    end sort
end SelectionSort
