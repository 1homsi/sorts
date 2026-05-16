[indent=4]

def shell_sort(arr: array of int): array of int
    n: int = arr.length
    gap: int = n / 2
    while gap > 0
        i: int = gap
        while i < n
            temp: int = arr[i]
            j: int = i
            while (j >= gap) and (arr[j - gap] > temp)
                arr[j] = arr[j - gap]
                j -= gap
            arr[j] = temp
            i += 1
        gap /= 2
    return arr

init
    arr: array of int = {64, 34, 25, 12, 22, 11, 90}
    sorted: array of int = shell_sort(arr)
    for v in sorted
        stdout.printf("%d ", v)
    print ""
