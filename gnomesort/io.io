GnomeSort := Object clone do(
    sort := method(arr,
        i := 0
        n := arr size
        while(i < n,
            if(i == 0 or(arr at(i) >= arr at(i - 1)),
                i = i + 1
            ,
                tmp := arr at(i)
                arr atPut(i, arr at(i - 1))
                arr atPut(i - 1, tmp)
                i = i - 1
            )
        )
        arr
    )
)
