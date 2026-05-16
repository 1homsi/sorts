public class RadixSort {
    static void countingSort(List<Integer> arr, Integer exp) {
        Integer n = arr.size();
        List<Integer> output = new List<Integer>();
        List<Integer> count = new List<Integer>();
        for (Integer i = 0; i < n; i++) output.add(0);
        for (Integer i = 0; i < 10; i++) count.add(0);
        for (Integer x : arr) count[Math.mod(x / exp, 10)]++;
        for (Integer i = 1; i < 10; i++) count[i] += count[i - 1];
        for (Integer i = n - 1; i >= 0; i--) {
            Integer idx = Math.mod(arr[i] / exp, 10);
            count[idx]--;
            output[count[idx]] = arr[i];
        }
        for (Integer i = 0; i < n; i++) arr[i] = output[i];
    }

    static List<Integer> radixSort(List<Integer> arr) {
        if (arr.isEmpty()) return arr;
        Integer max = arr[0];
        for (Integer x : arr) if (x > max) max = x;
        for (Integer exp = 1; max / exp > 0; exp *= 10) countingSort(arr, exp);
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{170, 45, 75, 90, 802, 24, 2, 66};
        System.debug(radixSort(arr));
    }
}
