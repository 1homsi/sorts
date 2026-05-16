import std.stdio;
import std.algorithm;
import std.random;

bool isSorted(int[] arr) {
    for (int i = 0; i < arr.length - 1; i++) {
        if (arr[i] > arr[i + 1]) return false;
    }
    return true;
}

int[] bogosort(int[] arr) {
    while (!isSorted(arr)) {
        arr.randomShuffle();
    }
    return arr;
}

void main() {
    int[] arr = [3, 1, 4, 1, 5, 9, 2, 6];
    writeln(bogosort(arr));
}
