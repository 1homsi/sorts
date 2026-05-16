main() {
    auto arr[5], n, cycleStart, item, pos, i, tmp, writes;
    arr[0] = 5; arr[1] = 4; arr[2] = 3; arr[3] = 2; arr[4] = 1;
    n = 5;
    writes = 0;
    cycleStart = 0;
    while (cycleStart < n-1) {
        item = arr[cycleStart];
        pos = cycleStart;
        i = cycleStart+1;
        while (i < n) {
            if (arr[i] < item) pos++;
            i++;
        }
        if (pos != cycleStart) {
            while (arr[pos] == item) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                i = cycleStart+1;
                while (i < n) {
                    if (arr[i] < item) pos++;
                    i++;
                }
                while (arr[pos] == item) pos++;
                tmp = arr[pos]; arr[pos] = item; item = tmp;
                writes++;
            }
        }
        cycleStart++;
    }
    i = 0;
    while (i < n) {
        printf("%d ", arr[i]);
        i++;
    }
    printf("*n");
}
