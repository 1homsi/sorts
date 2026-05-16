using System;

class BitonicSort {
    static void CompareAndSwap(int[] arr, int i, int j, bool direction) {
        if (direction == (arr[i] > arr[j])) {
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    static void BitonicMerge(int[] arr, int lo, int cnt, bool direction) {
        if (cnt > 1) {
            int k = cnt / 2;
            for (int i = lo; i < lo + k; i++) {
                CompareAndSwap(arr, i, i + k, direction);
            }
            BitonicMerge(arr, lo, k, direction);
            BitonicMerge(arr, lo + k, k, direction);
        }
    }

    static void Sort(int[] arr, int lo, int cnt, bool direction) {
        if (cnt > 1) {
            int k = cnt / 2;
            Sort(arr, lo, k, true);
            Sort(arr, lo + k, k, false);
            BitonicMerge(arr, lo, cnt, direction);
        }
    }

    static void Main() {
        int[] data = {3, 7, 4, 8, 6, 2, 1, 5};
        Sort(data, 0, data.Length, true);
        Console.WriteLine(string.Join(" ", data));
    }
}
