def cocktailSort(arr as (int)) as (int):
    swapped = true
    start = 0
    ending = len(arr) - 1
    while swapped:
        swapped = false
        for i in range(start, ending):
            if arr[i] > arr[i + 1]:
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        if not swapped:
            break
        swapped = false
        ending -= 1
        i = ending - 1
        while i >= start:
            if arr[i] > arr[i + 1]:
                tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            i -= 1
        start += 1
    return arr
