import ballerina/io;

function partition(int[] arr, int low, int high) returns int {
    int pivot = arr[high];
    int i = low;
    foreach int j in low ..< high {
        if arr[j] <= pivot {
            int tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
            i += 1;
        }
    }
    int tmp = arr[i];
    arr[i] = arr[high];
    arr[high] = tmp;
    return i;
}

function quicksort(int[] arr, int low, int high) {
    if low < high {
        int p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

public function main() {
    int[] arr = [3, 6, 8, 10, 1, 2, 1];
    quicksort(arr, 0, arr.length() - 1);
    io:println(arr);
}
