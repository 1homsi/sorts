function BucketSort(array<int> Arr, int MaxVal)
{
    local int Buckets[10];
    local int Result[6];
    local int i, Count;
    for (i = 0; i < 10; i++) Buckets[i] = 0;
    for (i = 0; i < 6; i++) Buckets[Arr[i]]++;
    Count = 0;
    for (i = 0; i < 10; i++) {
        if (Buckets[i] > 0) {
            Result[Count++] = i;
        }
    }
    return Result;
}
BucketSort([5,2,8,1,9,3], 10);