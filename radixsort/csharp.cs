using System;
using System.Linq;

class RadixSort {
    static void CountingSort(int[] arr, int exp) {
        int n = arr.Length;
        int[] output = new int[n];
        int[] count = new int[10];
        for (int i = 0; i < n; i++) count[(arr[i] / exp) % 10]++;
        for (int i = 1; i < 10; i++) count[i] += count[i - 1];
        for (int i = n - 1; i >= 0; i--) {
            int idx = (arr[i] / exp) % 10;
            output[--count[idx]] = arr[i];
        }
        Array.Copy(output, arr, n);
    }

    static void Sort(int[] arr) {
        if (arr.Length == 0) return;
        int max = arr.Max();
        for (int exp = 1; max / exp > 0; exp *= 10) CountingSort(arr, exp);
    }

    static void Main() {
        int[] arr = {170, 45, 75, 90, 802, 24, 2, 66};
        Sort(arr);
        Console.WriteLine(string.Join(", ", arr));
    }
}
