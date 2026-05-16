func cycle_sort(arr: Array) -> int:
    var writes = 0
    var n = arr.size()
    for cycle_start in range(n - 1):
        var item = arr[cycle_start]
        var pos = cycle_start
        for i in range(cycle_start + 1, n):
            if arr[i] < item:
                pos += 1
        if pos == cycle_start:
            continue
        while item == arr[pos]:
            pos += 1
        var tmp = arr[pos]
        arr[pos] = item
        item = tmp
        writes += 1
        while pos != cycle_start:
            pos = cycle_start
            for i in range(cycle_start + 1, n):
                if arr[i] < item:
                    pos += 1
            while item == arr[pos]:
                pos += 1
            tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes += 1
    return writes

func _ready():
    var arr = [5, 4, 3, 2, 1]
    cycle_sort(arr)
    print(arr)
