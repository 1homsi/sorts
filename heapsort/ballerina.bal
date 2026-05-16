import ballerina/io;

function heapify(int[] arr, int n, int i) {
    int largest = i;
    int left = 2 * i + 1;
    int right = 2 * i + 2;
    if left < n && arr[left] > arr[largest] { largest = left; }
    if right < n && arr[right] > arr[largest] { largest = right; }
    if largest != i {
        int tmp = arr[i]; arr[i] = arr[largest]; arr[largest] = tmp;
        heapify(arr, n, largest);
    }
}

function heapsort(int[] arr) {
    int n = arr.length();
    int i = n / 2 - 1;
    while i >= 0 { heapify(arr, n, i); i -= 1; }
    i = n - 1;
    while i > 0 {
        int tmp = arr[0]; arr[0] = arr[i]; arr[i] = tmp;
        heapify(arr, i, 0);
        i -= 1;
    }
}

public function main() {
    int[] arr = [12, 11, 13, 5, 6, 7];
    heapsort(arr);
    io:println(arr);
}
