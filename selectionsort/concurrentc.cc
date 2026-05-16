process SelectionSort(chan(int[]) input, chan(int[]) output) {
    int arr[];
    receive input, arr;
    
    int n = sizeof(arr);
    for (int i = 0; i < n - 1; i++) {
        int minIdx = i;
        for (int j = i + 1; j < n; j++) {
            if (arr[j] < arr[minIdx]) {
                minIdx = j;
            }
        }
        int tmp = arr[i];
        arr[i] = arr[minIdx];
        arr[minIdx] = tmp;
    }
    
    send output, arr;
}

main {
    int result[] = {5, 2, 8, 1, 9, 3};
    SelectionSort(result);
    print(result);
}