CombSort := Object clone do(
    sort := method(arr,
        n := arr size
        gap := n
        sorted := false
        while(sorted not,
            gap = (gap / 1.3) floor
            if(gap <= 1,
                gap = 1
                sorted = true
            )
            i := 0
            while(i + gap < n,
                if(arr at(i) > arr at(i + gap),
                    tmp := arr at(i)
                    arr atPut(i, arr at(i + gap))
                    arr atPut(i + gap, tmp)
                    sorted = false
                )
                i = i + 1
            )
        )
        arr
    )
)
