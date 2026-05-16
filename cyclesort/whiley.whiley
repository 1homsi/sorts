function cycleSort(int[] arr) -> (int[] result):
    int n = |arr|
    int writes = 0
    int cycleStart = 0
    while cycleStart < n - 1:
        int item = arr[cycleStart]
        int pos = cycleStart
        int i = cycleStart + 1
        while i < n:
            if arr[i] < item:
                pos = pos + 1
            i = i + 1
        if pos != cycleStart:
            while item == arr[pos]:
                pos = pos + 1
            int tmp = arr[pos]
            arr[pos] = item
            item = tmp
            writes = writes + 1
            while pos != cycleStart:
                pos = cycleStart
                i = cycleStart + 1
                while i < n:
                    if arr[i] < item:
                        pos = pos + 1
                    i = i + 1
                while item == arr[pos]:
                    pos = pos + 1
                tmp = arr[pos]
                arr[pos] = item
                item = tmp
                writes = writes + 1
        cycleStart = cycleStart + 1
    return arr

method main(System.Console console):
    int[] arr = [5, 4, 3, 2, 1]
    arr = cycleSort(arr)
    console.out.println(arr)
