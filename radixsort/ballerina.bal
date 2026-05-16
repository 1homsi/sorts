import ballerina/io;

function countingSort(int[] arr, int exp) {
    int n = arr.length();
    int[] output = [];
    int[] count = [];
    foreach int i in 0...n-1 { output.push(0); }
    foreach int i in 0...9 { count.push(0); }
    foreach int x in arr { count[(x / exp) % 10] += 1; }
    foreach int i in 1...9 { count[i] += count[i - 1]; }
    int i = n - 1;
    while i >= 0 {
        int idx = (arr[i] / exp) % 10;
        count[idx] -= 1;
        output[count[idx]] = arr[i];
        i -= 1;
    }
    foreach int j in 0...n-1 { arr[j] = output[j]; }
}

function radixSort(int[] arr) {
    if arr.length() == 0 { return; }
    int max = arr.reduce(function(int acc, int x) returns int { return x > acc ? x : acc; }, arr[0]);
    int exp = 1;
    while max / exp > 0 {
        countingSort(arr, exp);
        exp *= 10;
    }
}

public function main() {
    int[] arr = [170, 45, 75, 90, 802, 24, 2, 66];
    radixSort(arr);
    io:println(arr);
}
