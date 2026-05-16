RWStructuredBuffer<int> arr : register(u0);

[numthreads(1, 1, 1)]
void CycleSort(uint3 id : SV_DispatchThreadID)
{
    int n = 5;
    int writes = 0;
    for (int cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        int item = arr[cycleStart];
        int pos = cycleStart;
        for (int i = cycleStart + 1; i < n; i++) {
            if (arr[i] < item) pos++;
        }
        if (pos == cycleStart) continue;
        while (item == arr[pos]) pos++;
        int tmp = arr[pos]; arr[pos] = item; item = tmp;
        writes++;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (int i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            while (item == arr[pos]) pos++;
            tmp = arr[pos]; arr[pos] = item; item = tmp;
            writes++;
        }
    }
}
