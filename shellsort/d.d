import std.stdio;

void shellSort(int[] arr) {
    int n = cast(int)arr.length;
    for (int gap = n / 2; gap > 0; gap /= 2) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
}

void main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    shellSort(arr);
    writeln(arr);
}
