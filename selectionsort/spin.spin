int arr[5] = {5, 3, 1, 4, 2};
int n = 5;

active proctype SelectionSort() {
    int i, j, minIdx, tmp;
    for (i : 0 .. n-2) {
        minIdx = i;
        for (j : i+1 .. n-1) {
            if
            :: (arr[j] < arr[minIdx]) -> minIdx = j
            :: else -> skip
            fi
        }
        tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
}
