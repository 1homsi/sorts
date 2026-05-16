public class SelectionSort {
    public static void Sort(int[] arr) {
        int n = arr.Length;
        for (int i = 0; i < n; i++) {
            int minIdx = i;
            for (int j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j;
            }
            (arr[i], arr[minIdx]) = (arr[minIdx], arr[i]);
        }
    }
}
