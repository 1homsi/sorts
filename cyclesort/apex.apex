public class CycleSort {
    public static List<Integer> cycleSort(List<Integer> arr) {
        Integer n = arr.size();
        Integer writes = 0;
        for (Integer cycleStart = 0; cycleStart < n - 1; cycleStart++) {
            Integer item = arr[cycleStart];
            Integer pos = cycleStart;
            for (Integer i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            if (pos == cycleStart) continue;
            while (item == arr[pos]) pos++;
            Integer tmp = arr[pos];
            arr[pos] = item;
            item = tmp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (Integer i = cycleStart + 1; i < n; i++) {
                    if (arr[i] < item) pos++;
                }
                while (item == arr[pos]) pos++;
                tmp = arr[pos];
                arr[pos] = item;
                item = tmp;
                writes++;
            }
        }
        return arr;
    }

    public static void main() {
        List<Integer> arr = new List<Integer>{5, 4, 3, 2, 1};
        arr = cycleSort(arr);
        System.debug(arr);
    }
}
