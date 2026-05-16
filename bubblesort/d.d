import std.stdio;

void bubbleSort(int[] arr) {
    int n = cast(int)arr.length;
    bool swapped;
    do {
        swapped = false;
        foreach (i; 0 .. n - 1) {
            if (arr[i] > arr[i + 1]) {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n--;
    } while (swapped);
}

void main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    bubbleSort(arr);
    writeln(arr);
}
