[indent=4]

def cocktail_sort(arr: array of int)
    swapped: bool = true
    start: int = 0
    ending: int = arr.length - 1
    while swapped
        swapped = false
        for i: int = start to ending - 1
            if arr[i] > arr[i + 1]
                tmp: int = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
        if not swapped
            break
        swapped = false
        ending -= 1
        i: int = ending - 1
        while i >= start
            if arr[i] > arr[i + 1]
                tmp: int = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = true
            i -= 1
        start += 1
