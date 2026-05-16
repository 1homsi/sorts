public class apex {
    public static void stoogeSort(List<Integer> arr, Integer first, Integer last) {
        if (arr[first] > arr[last]) {
            Integer tmp = arr[first];
            arr[first] = arr[last];
            arr[last] = tmp;
        }
        if (last - first + 1 > 2) {
            Integer t = (last - first + 1) * 2 / 3;
            stoogeSort(arr, first, first + t - 1);
            stoogeSort(arr, last - t + 1, last);
            stoogeSort(arr, first, first + t - 1);
        }
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{3, 1, 4, 1, 5, 9, 2, 6};
        stoogeSort(arr, 0, arr.size() - 1);
        System.debug(arr);
    }
}
