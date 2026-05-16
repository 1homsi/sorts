public class PancakeSort {
    public static void flip(List<Integer> arr, Integer k) {
        Integer left = 0, right = k, tmp;
        while (left < right) {
            tmp = arr[left];
            arr[left] = arr[right];
            arr[right] = tmp;
            left++;
            right--;
        }
    }

    public static List<Integer> pancakeSort(List<Integer> arr) {
        Integer size = arr.size();
        while (size > 1) {
            Integer maxIdx = 0;
            for (Integer i = 1; i < size; i++) {
                if (arr[i] > arr[maxIdx]) maxIdx = i;
            }
            if (maxIdx != size - 1) {
                if (maxIdx != 0) flip(arr, maxIdx);
                flip(arr, size - 1);
            }
            size--;
        }
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{3, 6, 2, 7, 4, 1, 5};
        System.debug(pancakeSort(arr));
    }
}
