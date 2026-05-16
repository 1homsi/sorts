using System;

public class InsertionSort {
    public static void Sort(int[] arr)
        requires arr != null;
        ensures forall{int i in (0: arr.Length - 1); arr[i] <= arr[i+1]};
    {
        for (int i = 1; i < arr.Length; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }
}
