using System;

public class GnomeSort {
    public static void Sort(int[] arr) {
        int i = 0;
        while (i < arr.Length) {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++;
            } else {
                int temp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = temp;
                i--;
            }
        }
    }
}
