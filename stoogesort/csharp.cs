using System;
using System.Collections.Generic;

class Program {
    static void StoogeSort(List<int> arr, int first, int last) {
        if (arr[first] > arr[last]) {
            int tmp = arr[first];
            arr[first] = arr[last];
            arr[last] = tmp;
        }
        if (last - first + 1 > 2) {
            int t = (last - first + 1) * 2 / 3;
            StoogeSort(arr, first, first + t - 1);
            StoogeSort(arr, last - t + 1, last);
            StoogeSort(arr, first, first + t - 1);
        }
    }

    static void Main() {
        var arr = new List<int> {3, 1, 4, 1, 5, 9, 2, 6};
        StoogeSort(arr, 0, arr.Count - 1);
        Console.WriteLine(string.Join(" ", arr));
    }
}
