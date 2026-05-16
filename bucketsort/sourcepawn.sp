public Action BucketSort(Handle plugin, int numParams) {
    int arr[] = {5, 2, 8, 1, 9, 3};
    int buckets[10] = {0, ...};
    for (int i = 0; i < 6; i++) {
        buckets[arr[i]]++;
    }
    int result[6];
    int idx = 0;
    for (int i = 0; i < 10; i++) {
        for (int j = 0; j < buckets[i]; j++) {
            result[idx++] = i;
        }
    }
    PrintToChat(plugin, "%i", result);
    return Plugin_Continue;
}