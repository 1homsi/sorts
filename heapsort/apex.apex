public class apex {
    public static void heapify(List<Integer> arr, Integer n, Integer i) {
        Integer largest = i, left = 2*i+1, right = 2*i+2, tmp;
        if (left < n && arr[left] > arr[largest]) largest = left;
        if (right < n && arr[right] > arr[largest]) largest = right;
        if (largest != i) {
            tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
            heapify(arr, n, largest);
        }
    }

    public static List<Integer> heapsort(List<Integer> arr) {
        Integer n = arr.size(), tmp;
        for (Integer i = n/2-1; i >= 0; i--) heapify(arr, n, i);
        for (Integer i = n-1; i > 0; i--) {
            tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
            heapify(arr, i, 0);
        }
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{12, 11, 13, 5, 6, 7};
        heapsort(arr);
        System.debug(arr);
    }
}
