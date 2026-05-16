GnomeSort = Origin mimic do(
    sort = method(arr,
        i = 0
        n = arr length
        while(i < n,
            if(i == 0 || arr[i] >= arr[i - 1],
                i++
            ,
                tmp = arr[i]
                arr[i] = arr[i - 1]
                arr[i - 1] = tmp
                i--
            )
        )
        arr
    )
)
