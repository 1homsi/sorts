void bucketSort(array<int> arr, int maxVal) {
    array<int> buckets(maxVal);
    for (uint i = 0; i < maxVal; i++) {
        buckets[i] = 0;
    }
    for (uint i = 0; i < arr.length(); i++) {
        buckets[arr[i]]++;
    }
    array<int> result;
    for (uint i = 0; i < maxVal; i++) {
        for (int j = 0; j < buckets[i]; j++) {
            result.insertLast(i);
        }
    }
    print(result.join(", "));
}
bucketSort({5, 2, 8, 1, 9, 3}, 10);