using System;

class CycleSort {
    static int Sort(int[] arr) {
        int writes = 0;
        int n = arr.Length;
        for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
            int item = arr[cycleStart];
            int pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            if (pos == cycleStart) continue;
            while (item == arr[pos]) pos++;
            int temp = arr[pos];
            arr[pos] = item;
            item = temp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (int i = cycleStart + 1; i < n; i++) {
                    if (arr[i] < item) pos++;
                }
                while (item == arr[pos]) pos++;
                temp = arr[pos];
                arr[pos] = item;
                item = temp;
                writes++;
            }
        }
        return writes;
    }

    static void Main() {
        int[] arr = {5, 4, 3, 2, 1};
        Sort(arr);
        Console.WriteLine(string.Join(" ", arr));
    }
}
