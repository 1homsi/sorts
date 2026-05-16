using System;
using System.Collections.Generic;

class Bogosort {
    static bool IsSorted(int[] arr) {
        for (int i = 0; i < arr.Length - 1; i++) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }

    static void Shuffle(int[] arr, Random rng) {
        for (int i = arr.Length - 1; i > 0; i--) {
            int j = rng.Next(i + 1);
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    static void BogoSort(int[] arr) {
        Random rng = new Random();
        while (!IsSorted(arr)) {
            Shuffle(arr, rng);
        }
    }

    static void Main() {
        int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
        BogoSort(arr);
        Console.WriteLine(string.Join(", ", arr));
    }
}
