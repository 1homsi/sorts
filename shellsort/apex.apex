public class ShellSortApex {
    public static List<Integer> shellSort(List<Integer> arr) {
        Integer n = arr.size();
        Integer gap = n / 2;
        while (gap > 0) {
            for (Integer i = gap; i < n; i++) {
                Integer temp = arr[i];
                Integer j = i;
                while (j >= gap && arr[j - gap] > temp) {
                    arr[j] = arr[j - gap];
                    j -= gap;
                }
                arr[j] = temp;
            }
            gap /= 2;
        }
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{64, 34, 25, 12, 22, 11, 90};
        System.debug(shellSort(arr));
    }
}
