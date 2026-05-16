public class Bogosort {
    public static Boolean isSorted(List<Integer> arr) {
        for (Integer i = 0; i < arr.size() - 1; i++) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }

    public static List<Integer> shuffle(List<Integer> arr) {
        List<Integer> copy = arr.clone();
        Integer n = copy.size();
        for (Integer i = n - 1; i > 0; i--) {
            Integer j = (Integer)Math.floor(Math.random() * (i + 1));
            Integer tmp = copy[i];
            copy[i] = copy[j];
            copy[j] = tmp;
        }
        return copy;
    }

    public static List<Integer> bogosort(List<Integer> arr) {
        while (!isSorted(arr)) {
            arr = shuffle(arr);
        }
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{3, 1, 4, 1, 5, 9, 2, 6};
        System.debug(bogosort(arr));
    }
}
