public class java {
    static int cycleSort(int[] arr) {
        int writes = 0;
        int n = arr.length;
        for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
            int item = arr[cycleStart];
            int pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            if (pos == cycleStart) continue;
            while (item == arr[pos]) pos++;
            int temp = arr[pos];
            arr[pos] = item;
            item = temp;
            writes++;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (int i = cycleStart + 1; i < n; i++) {
                    if (arr[i] < item) pos++;
                }
                while (item == arr[pos]) pos++;
                temp = arr[pos];
                arr[pos] = item;
                item = temp;
                writes++;
            }
        }
        return writes;
    }

    public static void main(String[] args) {
        int[] arr = {5, 4, 3, 2, 1};
        cycleSort(arr);
        for (int x : arr) System.out.print(x + " ");
        System.out.println();
    }
}
