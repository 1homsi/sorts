void BubbleSort(inout int arr[7]) {
    int n = 7;
    bool swapped = true;
    while (swapped) {
        swapped = false;
        for (int i = 0; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                int tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        n--;
    }
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    int arr[7] = { 64, 34, 25, 12, 22, 11, 90 };
    BubbleSort(arr);
}
