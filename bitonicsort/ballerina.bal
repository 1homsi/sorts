import ballerina/io;

function compareAndSwap(int[] arr, int i, int j, boolean direction) {
    if direction == (arr[i] > arr[j]) {
        int tmp = arr[i];
        arr[i] = arr[j];
        arr[j] = tmp;
    }
}

function bitonicMerge(int[] arr, int lo, int cnt, boolean direction) {
    if cnt > 1 {
        int k = cnt / 2;
        foreach int i in lo ..< lo + k {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

function bitonicSort(int[] arr, int lo, int cnt, boolean direction) {
    if cnt > 1 {
        int k = cnt / 2;
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

public function main() {
    int[] data = [3, 7, 4, 8, 6, 2, 1, 5];
    bitonicSort(data, 0, data.length(), true);
    io:println(data);
}
