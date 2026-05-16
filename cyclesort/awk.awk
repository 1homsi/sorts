BEGIN {
    n = 5
    arr[0] = 5; arr[1] = 4; arr[2] = 3; arr[3] = 2; arr[4] = 1
    writes = 0

    for (cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        item = arr[cycleStart]
        pos = cycleStart
        for (i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++
        }
        if (pos == cycleStart) continue
        while (item == arr[pos]) pos++
        tmp = arr[pos]; arr[pos] = item; item = tmp
        writes++
        while (pos != cycleStart) {
            pos = cycleStart
            for (i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++
            }
            while (item == arr[pos]) pos++
            tmp = arr[pos]; arr[pos] = item; item = tmp
            writes++
        }
    }

    for (i = 0; i < n; i++) printf arr[i] " "
    print ""
}
