public class TimSort {
    static final Integer MIN_RUN = 32;

    static void insertionSort(List<Integer> arr, Integer left, Integer right) {
        for (Integer i = left + 1; i <= right; i++) {
            Integer key = arr[i];
            Integer j = i - 1;
            while (j >= left && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }

    static void mergeRuns(List<Integer> arr, Integer left, Integer mid, Integer right) {
        List<Integer> lp = new List<Integer>();
        List<Integer> rp = new List<Integer>();
        for (Integer i = left; i <= mid; i++) lp.add(arr[i]);
        for (Integer i = mid + 1; i <= right; i++) rp.add(arr[i]);
        Integer i = 0, j = 0, k = left;
        while (i < lp.size() && j < rp.size()) {
            if (lp[i] <= rp[j]) arr[k++] = lp[i++];
            else arr[k++] = rp[j++];
        }
        while (i < lp.size()) arr[k++] = lp[i++];
        while (j < rp.size()) arr[k++] = rp[j++];
    }

    public static List<Integer> timsort(List<Integer> arr) {
        Integer n = arr.size();
        for (Integer i = 0; i < n; i += MIN_RUN) {
            insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1));
        }
        Integer size = MIN_RUN;
        while (size < n) {
            for (Integer left = 0; left < n; left += 2 * size) {
                Integer mid = Math.min(left + size - 1, n - 1);
                Integer right = Math.min(left + 2 * size - 1, n - 1);
                if (mid < right) mergeRuns(arr, left, mid, right);
            }
            size *= 2;
        }
        return arr;
    }
}
