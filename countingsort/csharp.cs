using System;

class CountingSort {
    static int[] Sort(int[] arr) {
        if (arr.Length == 0) return arr;
        int max = arr[0], min = arr[0];
        foreach (int v in arr) { if (v > max) max = v; if (v < min) min = v; }
        int range = max - min + 1;
        int[] count = new int[range];
        foreach (int v in arr) count[v - min]++;
        for (int i = 1; i < range; i++) count[i] += count[i - 1];
        int[] output = new int[arr.Length];
        for (int i = arr.Length - 1; i >= 0; i--) {
            output[--count[arr[i] - min]] = arr[i];
        }
        return output;
    }

    static void Main() {
        int[] arr = {4, 2, 2, 8, 3, 3, 1};
        Console.WriteLine(string.Join(" ", Sort(arr)));
    }
}
