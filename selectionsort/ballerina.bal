import ballerina/io;

function selectionSort(int[] arr) returns int[] {
    int n = arr.length();
    foreach int i in 0 ..< n {
        int minIdx = i;
        foreach int j in (i + 1) ..< n {
            if arr[j] < arr[minIdx] {
                minIdx = j;
            }
        }
        int tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
    return arr;
}
