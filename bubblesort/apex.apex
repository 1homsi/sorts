public class BubbleSort {
    public static List<Integer> bubbleSort(List<Integer> arr) {
        Integer n = arr.size();
        Boolean swapped;
        do {
            swapped = false;
            for (Integer i = 0; i < n - 1; i++) {
                if (arr[i] > arr[i + 1]) {
                    Integer tmp = arr[i];
                    arr[i] = arr[i + 1];
                    arr[i + 1] = tmp;
                    swapped = true;
                }
            }
            n--;
        } while (swapped);
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{64, 34, 25, 12, 22, 11, 90};
        System.debug(bubbleSort(arr));
    }
}
