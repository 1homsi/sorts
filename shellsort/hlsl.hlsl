RWStructuredBuffer<int> arr : register(u0);
cbuffer Constants : register(b0) {
    int n;
};

[numthreads(1, 1, 1)]
void CSMain(uint3 id : SV_DispatchThreadID) {
    int gap = n / 2;
    while (gap > 0) {
        for (int i = gap; i < n; i++) {
            int temp = arr[i];
            int j = i;
            while (j >= gap && arr[j - gap] > temp) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
        gap /= 2;
    }
}
