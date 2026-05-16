main() {
    new arr[] = {5, 2, 8, 1, 9, 3};
    new buckets[10] = {0, ...};
    new result[sizeof(arr)];
    new idx = 0;
    
    for (new i = 0; i < sizeof(arr); i++) {
        buckets[arr[i]]++;
    }
    
    for (new i = 0; i < 10; i++) {
        for (new j = 0; j < buckets[i]; j++) {
            result[idx++] = i;
        }
    }
    
    for (new i = 0; i < sizeof(result); i++) {
        printf("%d ", result[i]);
    }
}