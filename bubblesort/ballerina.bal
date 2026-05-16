import ballerina/io;

function bubbleSort(int[] arr) returns int[] {
    int n = arr.length();
    boolean swapped;
    do {
        swapped = false;
        foreach int i in 0 ..< n - 1 {
            if arr[i] > arr[i + 1] {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n -= 1;
    } while swapped;
    return arr;
}

public function main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    io:println(bubbleSort(arr));
}
