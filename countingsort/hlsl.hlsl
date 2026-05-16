RWBuffer<int> arr : register(u0);
RWBuffer<int> output : register(u1);
RWBuffer<int> count : register(u2);

cbuffer Constants : register(b0) {
    int n;
    int minVal;
    int maxVal;
}

[numthreads(1, 1, 1)]
void CountingSort(uint3 id : SV_DispatchThreadID) {
    if (id.x == 0) {
        int range = maxVal - minVal + 1;
        for (int i = 0; i < range; i++) count[i] = 0;
        for (int i = 0; i < n; i++) count[arr[i] - minVal]++;
        for (int i = 1; i < range; i++) count[i] += count[i - 1];
        for (int i = n - 1; i >= 0; i--) {
            count[arr[i] - minVal]--;
            output[count[arr[i] - minVal]] = arr[i];
        }
    }
}
