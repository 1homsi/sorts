public class GnomeSort {
    public static void gnomeSort(int[] arr) {
        int i = 0;
        while (i < arr.length) {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++;
            } else {
                int temp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = temp;
                i--;
            }
        }
    }
}
