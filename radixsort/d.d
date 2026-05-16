import std.stdio;
import std.algorithm;

void countingSort(int[] arr, int exp) {
    int n = cast(int)arr.length;
    int[] output = new int[n];
    int[10] count;
    count[] = 0;
    foreach (x; arr) count[(x / exp) % 10]++;
    foreach (i; 1..10) count[i] += count[i-1];
    foreach_reverse (i; 0..n) {
        int idx = (arr[i] / exp) % 10;
        output[--count[idx]] = arr[i];
    }
    arr[] = output[];
}

void radixSort(int[] arr) {
    if (!arr.length) return;
    int max = arr.maxElement;
    for (int exp = 1; max / exp > 0; exp *= 10) countingSort(arr, exp);
}

void main() {
    int[] arr = [170, 45, 75, 90, 802, 24, 2, 66];
    radixSort(arr);
    writeln(arr);
}
