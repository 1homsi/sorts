RWStructuredBuffer<int> arr : register(u0);
cbuffer Params : register(b0) { int n; }

groupshared int stackLow[64];
groupshared int stackHigh[64];

[numthreads(1, 1, 1)]
void main(uint3 id : SV_DispatchThreadID) {
    if (id.x != 0) return;
    int sp = 0;
    stackLow[0] = 0;
    stackHigh[0] = n - 1;
    while (sp >= 0) {
        int low = stackLow[sp];
        int high = stackHigh[sp];
        sp--;
        if (low < high) {
            int pivot = arr[high];
            int i = low;
            for (int j = low; j < high; j++) {
                if (arr[j] <= pivot) {
                    int tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
                    i++;
                }
            }
            int tmp = arr[i]; arr[i] = arr[high]; arr[high] = tmp;
            sp++;
            stackLow[sp] = low;
            stackHigh[sp] = i - 1;
            sp++;
            stackLow[sp] = i + 1;
            stackHigh[sp] = high;
        }
    }
}
