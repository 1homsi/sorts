import ballerina/io;

function insertionSort(int[] arr) returns int[] {
    int n = arr.length();
    foreach int i in 1 ..< n {
        int key = arr[i];
        int j = i - 1;
        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j];
            j -= 1;
        }
        arr[j + 1] = key;
    }
    return arr;
}
