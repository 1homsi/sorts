public class CombSort {
    public static List<Integer> sort(List<Integer> arr) {
        Integer n = arr.size();
        Integer gap = n;
        Boolean sorted = false;
        while (!sorted) {
            gap = (Integer)(gap / 1.3);
            if (gap <= 1) {
                gap = 1;
                sorted = true;
            }
            for (Integer i = 0; i + gap < n; i++) {
                if (arr[i] > arr[i + gap]) {
                    Integer tmp = arr[i];
                    arr[i] = arr[i + gap];
                    arr[i + gap] = tmp;
                    sorted = false;
                }
            }
        }
        return arr;
    }
}
