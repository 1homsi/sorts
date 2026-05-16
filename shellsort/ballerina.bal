import ballerina/io;

function shellSort(int[] arr) returns int[] {
    int n = arr.length();
    int gap = n / 2;
    while gap > 0 {
        foreach int i in gap ..< n {
            int temp = arr[i];
            int j = i;
            while j >= gap && arr[j - gap] > temp {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
    return arr;
}

public function main() {
    int[] arr = [64, 34, 25, 12, 22, 11, 90];
    io:println(shellSort(arr));
}
