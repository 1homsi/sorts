fun int[] bucketSort(int arr[], int maxVal) {
    int buckets[maxVal];
    for (0 => int i; i < maxVal; i++) {
        0 => buckets[i];
    }
    for (0 => int i; i < arr.size(); i++) {
        arr[i] +=> buckets[arr[i]];
    }
    int result[0];
    for (0 => int i; i < maxVal; i++) {
        if (buckets[i] > 0) {
            result << i;
        }
    }
    return result;
}
bucketSort([5,2,8,1,9,3], 10) @=> int out[];
chout << out << endl;