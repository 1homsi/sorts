using System;

class SelectionSort {
    static void Sort(int[] arr)
        requires arr != null;
        ensures forall{int i in (0: arr.Length), int j in (i: arr.Length); arr[i] <= arr[j]};
    {
        int n = arr.Length;
        for (int i = 0; i < n; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j;
            }
            int tmp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp;
        }
    }
}
