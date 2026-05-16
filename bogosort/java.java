public class Bogosort {
    public static void bogosort(int[] arr) {
        while (!isSorted(arr)) {
            for (int i = arr.length - 1; i > 0; i--) {
                int j = (int)(Math.random() * (i + 1));
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }
    }
    
    static boolean isSorted(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }
}
