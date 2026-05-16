import ballerina/io;

function cycleSort(int[] arr) returns int {
    int writes = 0;
    int n = arr.length();
    foreach int cycleStart in 0 ..< n - 1 {
        int item = arr[cycleStart];
        int pos = cycleStart;
        foreach int i in cycleStart + 1 ..< n {
            if arr[i] < item {
                pos += 1;
            }
        }
        if pos == cycleStart {
            continue;
        }
        while item == arr[pos] {
            pos += 1;
        }
        int tmp = arr[pos];
        arr[pos] = item;
        item = tmp;
        writes += 1;
        while pos != cycleStart {
            pos = cycleStart;
            foreach int i in cycleStart + 1 ..< n {
                if arr[i] < item {
                    pos += 1;
                }
            }
            while item == arr[pos] {
                pos += 1;
            }
            tmp = arr[pos];
            arr[pos] = item;
            item = tmp;
            writes += 1;
        }
    }
    return writes;
}

public function main() {
    int[] arr = [5, 4, 3, 2, 1];
    _ = cycleSort(arr);
    io:println(arr);
}
