using System;

class PancakeSort {
    static void Flip(int[] arr, int k) {
        int left = 0, right = k;
        while (left < right) {
            int tmp = arr[left];
            arr[left] = arr[right];
            arr[right] = tmp;
            left++; right--;
        }
    }

    static void Sort(int[] arr) {
        for (int size = arr.Length; size > 1; size--) {
            int maxIdx = 0;
            for (int i = 1; i < size; i++) {
                if (arr[i] > arr[maxIdx]) maxIdx = i;
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) Flip(arr, maxIdx);
                Flip(arr, size - 1);
            }
        }
    }

    static void Main() {
        int[] arr = {3, 6, 2, 7, 4, 1, 5};
        Sort(arr);
        Console.WriteLine(string.Join(", ", arr));
    }
}
