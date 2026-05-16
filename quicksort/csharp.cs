using System;

class Quicksort {
    static int Partition(int[] arr, int low, int high) {
        int pivot = arr[high], i = low;
        for (int j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                i++;
            }
        }
        int t = arr[i]; arr[i] = arr[high]; arr[high] = t;
        return i;
    }

    static void Sort(int[] arr, int low, int high) {
        if (low < high) {
            int p = Partition(arr, low, high);
            Sort(arr, low, p - 1);
            Sort(arr, p + 1, high);
        }
    }

    static void Main() {
        int[] arr = {3, 6, 8, 10, 1, 2, 1};
        Sort(arr, 0, arr.Length - 1);
        Console.WriteLine(string.Join(" ", arr));
    }
}
