merge = method(left, right,
    result = list()
    i = 0; j = 0
    while(i < left length && j < right length,
        if(left[i] <= right[j],
            result add(left[i]); i = i + 1,
            result add(right[j]); j = j + 1
        )
    )
    while(i < left length, result add(left[i]); i = i + 1)
    while(j < right length, result add(right[j]); j = j + 1)
    result
)

mergeSort = method(arr,
    if(arr length <= 1, return(arr))
    mid = arr length / 2
    left = mergeSort(arr[0...mid])
    right = mergeSort(arr[mid..-1])
    merge(left, right)
)

arr = [38, 27, 43, 3, 9, 82, 10]
mergeSort(arr) println
