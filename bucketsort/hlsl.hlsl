RWStructuredBuffer<float> arr : register(u0);
RWStructuredBuffer<float> result : register(u1);
RWStructuredBuffer<int> params : register(u2);

groupshared float buckets[10][10];
groupshared int counts[10];

void insertionSort(int b, int m) {
    for (int i = 1; i < m; i++) {
        float key = buckets[b][i];
        int j = i - 1;
        while (j >= 0 && buckets[b][j] > key) {
            buckets[b][j + 1] = buckets[b][j];
            j--;
        }
        buckets[b][j + 1] = key;
    }
}

[numthreads(1, 1, 1)]
void CSMain(uint3 tid : SV_DispatchThreadID) {
    int n = params[0];
    float minV = asfloat(params[1]);
    float maxV = asfloat(params[2]);
    for (int i = 0; i < n; i++) counts[i] = 0;
    for (int i = 0; i < n; i++) {
        int idx = (int)((arr[i] - minV) / (maxV - minV + 1.0) * (float)n);
        if (idx >= n) idx = n - 1;
        buckets[idx][counts[idx]++] = arr[i];
    }
    int pos = 0;
    for (int b = 0; b < n; b++) {
        insertionSort(b, counts[b]);
        for (int i = 0; i < counts[b]; i++) result[pos++] = buckets[b][i];
    }
}
