RWStructuredBuffer<int> arr : register(u0);
RWStructuredBuffer<int> output_buf : register(u1);
RWStructuredBuffer<int> count_buf : register(u2);

cbuffer Constants : register(b0) {
    int n;
    int exp;
};

[numthreads(1, 1, 1)]
void CountingSort(uint3 id : SV_DispatchThreadID) {
    for (int i = 0; i < 10; i++) count_buf[i] = 0;
    for (int i = 0; i < n; i++) count_buf[(arr[i] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count_buf[i] += count_buf[i - 1];
    for (int i = n - 1; i >= 0; i--) {
        int idx = (arr[i] / exp) % 10;
        count_buf[idx]--;
        output_buf[count_buf[idx]] = arr[i];
    }
    for (int i = 0; i < n; i++) arr[i] = output_buf[i];
}
