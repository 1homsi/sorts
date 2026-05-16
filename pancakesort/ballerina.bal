import ballerina/io;

function flip(int[] arr, int k) {
    int left = 0;
    int right = k;
    while (left < right) {
        int tmp = arr[left];
        arr[left] = arr[right];
        arr[right] = tmp;
        left += 1;
        right -= 1;
    }
}

function pancakeSort(int[] arr) {
    int size = arr.length();
    while (size > 1) {
        int maxIdx = 0;
        int i = 1;
        while (i < size) {
            if (arr[i] > arr[maxIdx]) {
                maxIdx = i;
            }
            i += 1;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) {
                flip(arr, maxIdx);
            }
            flip(arr, size - 1);
        }
        size -= 1;
    }
}

public function main() {
    int[] arr = [3, 6, 2, 7, 4, 1, 5];
    pancakeSort(arr);
    io:println(arr);
}
