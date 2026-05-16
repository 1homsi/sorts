using System;

class TimSort {
    const int MIN_RUN = 32;

    static void InsertionSort(int[] arr, int left, int right) {
        for (int i = left + 1; i <= right; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= left && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }

    static void Merge(int[] arr, int left, int mid, int right) {
        int ln = mid - left + 1, rn = right - mid;
        int[] lp = new int[ln], rp = new int[rn];
        Array.Copy(arr, left, lp, 0, ln);
        Array.Copy(arr, mid + 1, rp, 0, rn);
        int i = 0, j = 0, k = left;
        while (i < ln && j < rn) {
            if (lp[i] <= rp[j]) arr[k++] = lp[i++];
            else arr[k++] = rp[j++];
        }
        while (i < ln) arr[k++] = lp[i++];
        while (j < rn) arr[k++] = rp[j++];
    }

    static void Sort(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n; i += MIN_RUN) {
            InsertionSort(arr, i, Math.Min(i + MIN_RUN - 1, n - 1));
        }
        for (int size = MIN_RUN; size < n; size *= 2) {
            for (int left = 0; left < n; left += 2 * size) {
                int mid = Math.Min(left + size - 1, n - 1);
                int right = Math.Min(left + 2 * size - 1, n - 1);
                if (mid < right) Merge(arr, left, mid, right);
            }
        }
    }

    static void Main() {
        int[] arr = {5, 2, 8, 1, 9, 3, 7, 4, 6};
        Sort(arr);
        Console.WriteLine(string.Join(", ", arr));
    }
}
