import std.stdio;

int cycleSort(int[] arr) {
    int writes = 0;
    int n = cast(int)arr.length;
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = arr[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        int tmp = arr[pos]; arr[pos] = item; item = tmp;
        writes++;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes++;
        }
    }
    return writes;
}

void main() {
    int[] arr = [5, 4, 3, 2, 1];
    cycleSort(arr);
    writeln(arr);
}
