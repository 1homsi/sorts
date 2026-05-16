void setup() {
    int[] arr = {5, 2, 8, 1, 9, 3};
    int[] result = bucketSort(arr, 10);
    println(java.util.Arrays.toString(result));
}

int[] bucketSort(int[] arr, int maxVal) {
    int[] buckets = new int[maxVal];
    for (int num : arr) {
        if (num >= 0 && num < maxVal) {
            buckets[num]++;
        }
    }
    int[] result = new int[arr.length];
    int idx = 0;
    for (int i = 0; i < maxVal; i++) {
        for (int j = 0; j < buckets[i]; j++) {
            result[idx++] = i;
        }
    }
    return result;
}