fn cocktail_sort(inout arr: DynamicVector[Int]):
    var swapped = True
    var start = 0
    var end = len(arr) - 1
    while swapped:
        swapped = False
        for i in range(start, end):
            if arr[i] > arr[i + 1]:
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = True
        if not swapped:
            break
        swapped = False
        end -= 1
        var i = end - 1
        while i >= start:
            if arr[i] > arr[i + 1]:
                let tmp = arr[i]
                arr[i] = arr[i + 1]
                arr[i + 1] = tmp
                swapped = True
            i -= 1
        start += 1
