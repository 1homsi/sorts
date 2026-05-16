MergeSort := Object clone do(
    merge := method(left, right,
        result := list()
        i := 0; j := 0
        while(i < left size and j < right size,
            if(left at(i) <= right at(j),
                result append(left at(i)); i = i + 1,
                result append(right at(j)); j = j + 1
            )
        )
        while(i < left size, result append(left at(i)); i = i + 1)
        while(j < right size, result append(right at(j)); j = j + 1)
        result
    )

    sort := method(arr,
        if(arr size <= 1, return arr)
        mid := arr size / 2 floor
        left := sort(arr slice(0, mid))
        right := sort(arr slice(mid))
        merge(left, right)
    )
)

arr := list(38, 27, 43, 3, 9, 82, 10)
MergeSort sort(arr) println
