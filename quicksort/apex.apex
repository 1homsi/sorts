public class QuickSort {
    public static Integer partition(List<Integer> arr, Integer low, Integer high) {
        Integer pivot = arr[high];
        Integer i = low;
        for (Integer j = low; j < high; j++) {
            if (arr[j] <= pivot) {
                Integer tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                i++;
            }
        }
        Integer tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
        return i;
    }

    public static void quicksort(List<Integer> arr, Integer low, Integer high) {
        if (low < high) {
            Integer p = partition(arr, low, high);
            quicksort(arr, low, p - 1);
            quicksort(arr, p + 1, high);
        }
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{3, 6, 8, 10, 1, 2, 1};
        quicksort(arr, 0, arr.size() - 1);
        System.debug(arr);
    }
}
