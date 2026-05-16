import std.algorithm : swap;

void combSort(int[] arr) {
    int n = cast(int)arr.length;
    int gap = n;
    double shrink = 1.3;
    bool sorted = false;
    while (!sorted) {
        gap = cast(int)(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                swap(arr[i], arr[i + gap]);
                sorted = false;
            }
        }
    }
}
