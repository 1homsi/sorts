public class InsertionSort {
    public static List<Integer> sort(List<Integer> arr) {
        Integer n = arr.size();
        for (Integer i = 1; i < n; i++) {
            Integer key = arr[i];
            Integer j = i - 1;
            while (j >= 0 && arr[j] > key) {
                arr[j + 1] = arr[j];
                j--;
            }
            arr[j + 1] = key;
        }
        return arr;
    }
}
