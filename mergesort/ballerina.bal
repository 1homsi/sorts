import ballerina/io;

function merge(int[] left, int[] right) returns int[] {
    int[] result = [];
    int i = 0;
    int j = 0;
    while i < left.length() && j < right.length() {
        if left[i] <= right[j] {
            result.push(left[i]);
            i += 1;
        } else {
            result.push(right[j]);
            j += 1;
        }
    }
    while i < left.length() { result.push(left[i]); i += 1; }
    while j < right.length() { result.push(right[j]); j += 1; }
    return result;
}

function mergesort(int[] arr) returns int[] {
    if arr.length() <= 1 { return arr; }
    int mid = arr.length() / 2;
    return merge(mergesort(arr.slice(0, mid)), mergesort(arr.slice(mid)));
}

public function main() {
    io:println(mergesort([5, 2, 8, 1, 9, 3]));
}
