object CombSort
    export sort

    operation sort[arr: Array[Integer], n: Integer]
        var gap: Integer <- n
        var sorted: Boolean <- false
        var tmp: Integer
        loop
            exit when sorted
            gap <- (gap * 10) / 13
            if gap <= 1 then
                gap <- 1
                sorted <- true
            end if
            var i: Integer <- 0
            loop
                exit when i + gap >= n
                if arr[i] > arr[i + gap] then
                    tmp <- arr[i]
                    arr[i] <- arr[i + gap]
                    arr[i + gap] <- tmp
                    sorted <- false
                end if
                i <- i + 1
            end loop
        end loop
    end operation

end CombSort
