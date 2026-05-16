public class java {
    static void stoogeSort(int[] arr, int first, int last) {
        if (arr[first] > arr[last]) {
            int tmp = arr[first];
            arr[first] = arr[last];
            arr[last] = tmp;
        }
        if (last - first + 1 > 2) {
            int t = (last - first + 1) * 2 / 3;
            stoogeSort(arr, first, first + t - 1);
            stoogeSort(arr, last - t + 1, last);
            stoogeSort(arr, first, first + t - 1);
        }
    }

    public static void main(String[] args) {
        int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
        stoogeSort(arr, 0, arr.length - 1);
        for (int x : arr) System.out.print(x + " ");
        System.out.println();
    }
}
