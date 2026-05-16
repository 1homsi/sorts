import ballerina/io;

function combSort(int[] arr) returns int[] {
    int n = arr.length();
    int gap = n;
    boolean sorted = false;
    while !sorted {
        gap = <int>(gap / 1.3);
        if gap <= 1 {
            gap = 1;
            sorted = true;
        }
        foreach int i in 0 ..< n - gap {
            if arr[i] > arr[i + gap] {
                int tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
    return arr;
}
