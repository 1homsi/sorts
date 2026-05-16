RWStructuredBuffer<int> arr : register(u0);
cbuffer Constants : register(b0) { int n; }

[numthreads(1, 1, 1)]
void CombSort(uint3 id : SV_DispatchThreadID) {
    int gap = n;
    bool sorted = false;
    while (!sorted) {
        gap = (int)((float)gap / 1.3f);
        if (gap <= 1) {
            gap = 1;
            sorted = true;
        }
        for (int i = 0; i + gap < n; i++) {
            if (arr[i] > arr[i + gap]) {
                int tmp = arr[i];
                arr[i] = arr[i + gap];
                arr[i + gap] = tmp;
                sorted = false;
            }
        }
    }
}
