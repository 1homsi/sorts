RadixSort := Object clone do(
    getDigit := method(x, exp, (x / exp) floor % 10)

    countingSort := method(arr, exp,
        result := list()
        0 to(9) foreach(d,
            arr foreach(x,
                if(getDigit(x, exp) == d, result append(x))
            )
        )
        result
    )

    sort := method(arr,
        if(arr size == 0, return arr)
        maxVal := arr reduce(max, 0)
        exp := 1
        result := arr
        while(maxVal / exp floor > 0,
            result = countingSort(result, exp)
            exp = exp * 10
        )
        result
    )
)

arr := list(170, 45, 75, 90, 802, 24, 2, 66)
RadixSort sort(arr) println
