import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

public class java {
    static boolean isSorted(int[] arr) {
        for (int i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }

    static void shuffle(int[] arr) {
        List<Integer> list = new ArrayList<>();
        for (int v : arr) list.add(v);
        Collections.shuffle(list);
        for (int i = 0; i < arr.length; i++) arr[i] = list.get(i);
    }

    static int[] bogosort(int[] arr) {
        while (!isSorted(arr)) {
            shuffle(arr);
        }
        return arr;
    }

    public static void main(String[] args) {
        int[] arr = {3, 1, 4, 1, 5, 9, 2, 6};
        System.out.println(Arrays.toString(bogosort(arr)));
    }
}
