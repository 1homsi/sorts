import ballerina/io;

function cocktailSort(int[] arr) returns int[] {
    boolean swapped = true;
    int start = 0;
    int ending = arr.length() - 1;
    while swapped {
        swapped = false;
        foreach int i in start ..< ending {
            if arr[i] > arr[i + 1] {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if !swapped {
            break;
        }
        swapped = false;
        ending -= 1;
        int i = ending - 1;
        while i >= start {
            if arr[i] > arr[i + 1] {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
            i -= 1;
        }
        start += 1;
    }
    return arr;
}
