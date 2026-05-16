selectionSort :: proc (arr: []int) {
    n := arr.count;
    for i in 0..n-2 {
        minIdx := i;
        for j in i+1..n-1 {
            if arr[j] < arr[minIdx] {
                minIdx = j;
            }
        }
        tmp := arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
}

arr := int.[5, 2, 8, 1, 9, 3];
selectionSort(arr);
print(arr);