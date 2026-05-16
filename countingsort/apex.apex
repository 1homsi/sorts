public class CountingSort {
    public static Integer[] sort(Integer[] arr) {
        if (arr == null || arr.size() == 0) return arr;
        Integer minVal = arr[0], maxVal = arr[0];
        for (Integer v : arr) {
            if (v < minVal) minVal = v;
            if (v > maxVal) maxVal = v;
        }
        Integer range = maxVal - minVal + 1;
        Integer[] count = new Integer[range];
        for (Integer i = 0; i < range; i++) count[i] = 0;
        for (Integer v : arr) count[v - minVal]++;
        for (Integer i = 1; i < range; i++) count[i] += count[i - 1];
        Integer[] output = new Integer[arr.size()];
        for (Integer i = arr.size() - 1; i >= 0; i--) {
            count[arr[i] - minVal]--;
            output[count[arr[i] - minVal]] = arr[i];
        }
        return output;
    }

    public static void main() {
        Integer[] arr = new Integer[]{4, 2, 2, 8, 3, 3, 1};
        Integer[] result = sort(arr);
        System.debug(result);
    }
}
