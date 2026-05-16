public class BitonicSort {
    public static void compareAndSwap(List<Integer> arr, Integer i, Integer j, Boolean direction) {
        if (direction == (arr[i] > arr[j])) {
            Integer tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    public static void bitonicMerge(List<Integer> arr, Integer lo, Integer cnt, Boolean direction) {
        if (cnt > 1) {
            Integer k = cnt / 2;
            for (Integer i = lo; i < lo + k; i++) {
                compareAndSwap(arr, i, i + k, direction);
            }
            bitonicMerge(arr, lo, k, direction);
            bitonicMerge(arr, lo + k, k, direction);
        }
    }

    public static void bitonicSort(List<Integer> arr, Integer lo, Integer cnt, Boolean direction) {
        if (cnt > 1) {
            Integer k = cnt / 2;
            bitonicSort(arr, lo, k, true);
            bitonicSort(arr, lo + k, k, false);
            bitonicMerge(arr, lo, cnt, direction);
        }
    }

    public static void main() {
        List<Integer> data = new List<Integer>{3, 7, 4, 8, 6, 2, 1, 5};
        bitonicSort(data, 0, data.size(), true);
        System.debug(data);
    }
}
