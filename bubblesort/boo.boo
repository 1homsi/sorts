def bubbleSort(arr as (int)) as (int):
    n = len(arr)
    swapped = true
    while swapped:
        swapped = false
        for i in range(n - 1):
            if arr[i] > arr[i + 1]:
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        n -= 1
    return arr

arr = (64, 34, 25, 12, 22, 11, 90)
sorted = bubbleSort(arr)
print join(str(x) for x in sorted, " ")
