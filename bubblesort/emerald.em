object BubbleSort
    export operation sort [arr : Array.of[Integer]] -> [result : Array.of[Integer]]
        var n : Integer <- arr.size
        var swapped : Boolean <- true
        var tmp : Integer
        loop
            exit when ~swapped
            swapped <- false
            var i : Integer <- 1
            loop
                exit when i >= n
                if (arr[i] > arr[i+1]) then
                    tmp <- arr[i]
                    arr[i] <- arr[i+1]
                    arr[i+1] <- tmp
                    swapped <- true
                end if
                i <- i + 1
            end loop
            n <- n - 1
        end loop
        result <- arr
    end sort
end BubbleSort
