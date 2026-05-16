public class java {
    static void compareAndSwap(int[] arr, int i, int j, boolean direction) {
        if (direction == (arr[i] > arr[j])) {
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
    }

    static void bitonicMerge(int[] arr, int lo, int cnt, boolean direction) {
        if (cnt > 1) {
            int k = cnt / 2;
            for (int i = lo; i < lo + k; i++) {
                compareAndSwap(arr, i, i + k, direction);
            }
            bitonicMerge(arr, lo, k, direction);
            bitonicMerge(arr, lo + k, k, direction);
        }
    }

    static void bitonicSort(int[] arr, int lo, int cnt, boolean direction) {
        if (cnt > 1) {
            int k = cnt / 2;
            bitonicSort(arr, lo, k, true);
            bitonicSort(arr, lo + k, k, false);
            bitonicMerge(arr, lo, cnt, direction);
        }
    }

    public static void main(String[] args) {
        int[] data = {3, 7, 4, 8, 6, 2, 1, 5};
        bitonicSort(data, 0, data.length, true);
        for (int x : data) System.out.print(x + " ");
        System.out.println();
    }
}
