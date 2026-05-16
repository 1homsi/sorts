RWStructuredBuffer<int> arr : register(u0);
cbuffer Params : register(b0) {
    int n;
};

[numthreads(1, 1, 1)]
void CocktailSort(uint3 id : SV_DispatchThreadID) {
    bool swapped = true;
    int start = 0;
    int end = n - 1;
    int tmp;
    while (swapped) {
        swapped = false;
        for (int i = start; i < end; i++) {
            if (arr[i] > arr[i + 1]) {
                tmp = arr[i];
                arr[i] = arr[i + 1];
                arr[i + 1] = tmp;
                swapped = true;
            }
        }
        if (!swapped) break;
        swapped = false;
        end--;
        for (int j = end - 1; j >= start; j--) {
            if (arr[j] > arr[j + 1]) {
                tmp = arr[j];
                arr[j] = arr[j + 1];
                arr[j + 1] = tmp;
                swapped = true;
            }
        }
        start++;
    }
}
