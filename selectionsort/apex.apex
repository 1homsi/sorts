public class SelectionSort {
    public static List<Integer> sort(List<Integer> arr) {
        Integer n = arr.size();
        for (Integer i = 0; i < n; i++) {
            Integer minIdx = i;
            for (Integer j = i + 1; j < n; j++) {
                if (arr[j] < arr[minIdx]) minIdx = j;
            }
            Integer tmp = arr[i]; arr[i] = arr[minIdx]; arr[minIdx] = tmp;
        }
        return arr;
    }
}
