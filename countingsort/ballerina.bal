import ballerina/io;

function countingSort(int[] arr) returns int[] {
    int n = arr.length();
    if n == 0 { return arr; }
    int minVal = arr[0]; int maxVal = arr[0];
    foreach int v in arr {
        if v < minVal { minVal = v; }
        if v > maxVal { maxVal = v; }
    }
    int range = maxVal - minVal + 1;
    int[] count = [];
    foreach int i in 0 ..< range { count.push(0); }
    foreach int v in arr { count[v - minVal] += 1; }
    foreach int i in 1 ..< range { count[i] += count[i - 1]; }
    int[] output = [];
    foreach int i in 0 ..< n { output.push(0); }
    int i = n - 1;
    while i >= 0 {
        int v = arr[i];
        count[v - minVal] -= 1;
        output[count[v - minVal]] = v;
        i -= 1;
    }
    return output;
}

public function main() {
    int[] arr = [4, 2, 2, 8, 3, 3, 1];
    io:println(countingSort(arr));
}
