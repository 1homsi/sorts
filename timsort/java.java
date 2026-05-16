import java.util.Arrays;

public class java {
    static final int MIN_RUN = 32;

    static void insertionSort(int[] arr, int left, int right) {
        for (int i = left + 1; i <= right; i++) {
            int key = arr[i];
            int j = i - 1;
            while (j >= left && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
    }

    static void merge(int[] arr, int left, int mid, int right) {
        int[] leftPart = Arrays.copyOfRange(arr, left, mid + 1);
        int[] rightPart = Arrays.copyOfRange(arr, mid + 1, right + 1);
        int i = 0, j = 0, k = left;
        while (i < leftPart.length && j < rightPart.length) {
            if (leftPart[i] <= rightPart[j]) arr[k++] = leftPart[i++];
            else arr[k++] = rightPart[j++];
        }
        while (i < leftPart.length) arr[k++] = leftPart[i++];
        while (j < rightPart.length) arr[k++] = rightPart[j++];
    }

    static void timsort(int[] arr) {
        int n = arr.length;
        for (int i = 0; i < n; i += MIN_RUN) {
            insertionSort(arr, i, Math.min(i + MIN_RUN - 1, n - 1));
        }
        for (int size = MIN_RUN; size < n; size *= 2) {
            for (int left = 0; left < n; left += 2 * size) {
                int mid = Math.min(left + size - 1, n - 1);
                int right = Math.min(left + 2 * size - 1, n - 1);
                if (mid < right) merge(arr, left, mid, right);
            }
        }
    }

    public static void main(String[] args) {
        int[] arr = {5, 2, 8, 1, 9, 3, 7, 4, 6};
        timsort(arr);
        System.out.println(Arrays.toString(arr));
    }
}
