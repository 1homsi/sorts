import std.stdio;

void heapify(int[] arr, int n, int i) {
    int largest = i, left = 2*i+1, right = 2*i+2;
    if (left < n && arr[left] > arr[largest]) largest = left;
    if (right < n && arr[right] > arr[largest]) largest = right;
    if (largest != i) {
        import std.algorithm : swap;
        swap(arr[i], arr[largest]);
        heapify(arr, n, largest);
    }
}

void heapsort(int[] arr) {
    int n = cast(int)arr.length;
    for (int i = n/2-1; i >= 0; i--) heapify(arr, n, i);
    for (int i = n-1; i > 0; i--) {
        import std.algorithm : swap;
        swap(arr[0], arr[i]);
        heapify(arr, i, 0);
    }
}

void main() {
    int[] arr = [12, 11, 13, 5, 6, 7];
    heapsort(arr);
    writeln(arr);
}
