import std.stdio;
import std.algorithm;

void flip(int[] arr, int k) {
    int left = 0, right = k;
    while (left < right) {
        swap(arr[left], arr[right]);
        left++; right--;
    }
}

void pancakeSort(int[] arr) {
    for (int size = cast(int)arr.length; size > 1; size--) {
        int maxIdx = 0;
        for (int i = 1; i < size; i++) {
            if (arr[i] > arr[maxIdx]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
}

void main() {
    int[] arr = [3, 6, 2, 7, 4, 1, 5];
    pancakeSort(arr);
    writeln(arr);
}
