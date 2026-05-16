RWBuffer<int> arr : register(u0);

void stoogeSort(int first, int last) {
    if (arr[first] > arr[last]) {
        int tmp = arr[first];
        arr[first] = arr[last];
        arr[last] = tmp;
    }
    int n = last - first + 1;
    if (n > 2) {
        int t = n * 2 / 3;
        stoogeSort(first, first + t - 1);
        stoogeSort(last - t + 1, last);
        stoogeSort(first, first + t - 1);
    }
}

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    if (id.x == 0) {
        stoogeSort(0, 7);
    }
}
