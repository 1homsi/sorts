import ballerina/io;
import ballerina/random;

function isSorted(int[] arr) returns boolean {
    foreach int i in 0 ..< arr.length() - 1 {
        if arr[i] > arr[i + 1] {
            return false;
        }
    }
    return true;
}

function shuffle(int[] arr) returns int[]|error {
    int n = arr.length();
    int[] a = arr.clone();
    foreach int i in 0 ..< n {
        int j = check random:createIntInRange(0, n);
        int tmp = a[i];
        a[i] = a[j];
        a[j] = tmp;
    }
    return a;
}

function bogosort(int[] arr) returns int[]|error {
    int[] a = arr.clone();
    while !isSorted(a) {
        a = check shuffle(a);
    }
    return a;
}

public function main() returns error? {
    int[] arr = [3, 1, 4, 1, 5, 9, 2, 6];
    int[] sorted = check bogosort(arr);
    io:println(sorted);
}
