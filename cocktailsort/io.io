CocktailSort := Object clone do(
    sort := method(arr,
        swapped := true
        start := 0
        end := arr size - 1
        while(swapped,
            swapped = false
            for(i, start, end - 1,
                if(arr at(i) > arr at(i + 1),
                    tmp := arr at(i)
                    arr atPut(i, arr at(i + 1))
                    arr atPut(i + 1, tmp)
                    swapped = true
                )
            )
            if(swapped not, break)
            swapped = false
            end = end - 1
            i := end - 1
            while(i >= start,
                if(arr at(i) > arr at(i + 1),
                    tmp := arr at(i)
                    arr atPut(i, arr at(i + 1))
                    arr atPut(i + 1, tmp)
                    swapped = true
                )
                i = i - 1
            )
            start = start + 1
        )
        arr
    )
)
