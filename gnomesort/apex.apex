public class GnomeSort {
    public static List<Integer> sort(List<Integer> arr) {
        Integer i = 0;
        Integer n = arr.size();
        while (i < n) {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++;
            } else {
                Integer tmp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = tmp;
                i--;
            }
        }
        return arr;
    }
}
