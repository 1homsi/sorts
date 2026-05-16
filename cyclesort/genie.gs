[indent=4]

def cycle_sort(arr: array of int): int
    writes: int = 0
    n: int = arr.length
    cycle_start: int = 0
    while cycle_start < n - 1
        item: int = arr[cycle_start]
        pos: int = cycle_start
        i: int = cycle_start + 1
        while i < n
            if arr[i] < item
                pos++
            i++
        if pos != cycle_start
            while item == arr[pos]
                pos++
            tmp: int = arr[pos]
            arr[pos] = item
            item = tmp
            writes++
            while pos != cycle_start
                pos = cycle_start
                i = cycle_start + 1
                while i < n
                    if arr[i] < item
                        pos++
                    i++
                while item == arr[pos]
                    pos++
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes++
        cycle_start++
    return writes

init
    arr: array of int = {5, 4, 3, 2, 1}
    cycle_sort(arr)
    for v in arr
        stdout.printf("%d ", v)
    stdout.printf("\n")
