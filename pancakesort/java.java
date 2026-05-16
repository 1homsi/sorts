import java.util.Arrays;

public class java {
    static void flip(int[] arr, int k) {
        int left = 0, right = k;
        while (left < right) {
            int tmp = arr[left];
            arr[left] = arr[right];
            arr[right] = tmp;
            left++; right--;
        }
    }

    static void pancakeSort(int[] arr) {
        for (int size = arr.length; size > 1; size--) {
            int maxIdx = 0;
            for (int i = 1; i < size; i++) {
                if (arr[i] > arr[maxIdx]) maxIdx = i;
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx);
                flip(arr, size - 1);
            }
        }
    }

    public static void main(String[] args) {
        int[] arr = {3, 6, 2, 7, 4, 1, 5};
        pancakeSort(arr);
        System.out.println(Arrays.toString(arr));
    }
}
