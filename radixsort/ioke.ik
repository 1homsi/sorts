RadixSort = Origin mimic do(
    getDigit = method(x, exp, (x / exp) floor % 10)

    countingSort = method(arr, exp,
        result = list()
        0 to(9) each(d,
            arr each(x,
                if(getDigit(x, exp) == d, result << x)
            )
        )
        result
    )

    sort = method(arr,
        if(arr empty?, return(arr))
        maxVal = arr inject(0, x, acc, if(x > acc, x, acc))
        exp = 1
        result = arr
        while((maxVal / exp) floor > 0,
            result = countingSort(result, exp)
            exp = exp * 10
        )
        result
    )
)

RadixSort sort(list(170, 45, 75, 90, 802, 24, 2, 66)) println
