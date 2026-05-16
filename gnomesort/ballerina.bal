import ballerina/io;

function gnomeSort(int[] arr) returns int[] {
    int i = 0;
    int n = arr.length();
    while i < n {
        if i == 0 || arr[i] >= arr[i - 1] {
            i += 1;
        } else {
            int tmp = arr[i];
            arr[i] = arr[i - 1];
            arr[i - 1] = tmp;
            i -= 1;
        }
    }
    return arr;
}
