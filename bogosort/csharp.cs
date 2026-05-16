using System;
using System.Linq;

public class Bogosort {
    public static void Sort(int[] arr) {
        while (!arr.SequenceEqual(arr.OrderBy(x => x))) {
            for (int i = arr.Length - 1; i > 0; i--) {
                int j = new Random().Next(i + 1);
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }
    }
}
