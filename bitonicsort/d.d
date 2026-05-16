import std.stdio;
import std.algorithm;

void compareAndSwap(ref int[] arr, int i, int j, bool direction) {
    if (direction == (arr[i] > arr[j])) {
        swap(arr[i], arr[j]);
    }
}

void bitonicMerge(ref int[] arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        for (int i = lo; i < lo + k; i++) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

void bitonicSort(ref int[] arr, int lo, int cnt, bool direction) {
    if (cnt > 1) {
        int k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

void main() {
    int[] data = [3, 7, 4, 8, 6, 2, 1, 5];
    bitonicSort(data, 0, cast(int)data.length, true);
    writeln(data);
}
