import std.stdio;
import std.algorithm;

int[] countingSort(int[] arr) {
    if (arr.length == 0) return arr;
    int min = arr.minElement;
    int max = arr.maxElement;
    int range = max - min + 1;
    int[] count = new int[](range);
    foreach (v; arr) count[v - min]++;
    foreach (i; 1 .. range) count[i] += count[i - 1];
    int[] output = new int[](arr.length);
    foreach_reverse (v; arr) {
        output[--count[v - min]] = v;
    }
    return output;
}

void main() {
    writeln(countingSort([4, 2, 2, 8, 3, 3, 1]));
}
