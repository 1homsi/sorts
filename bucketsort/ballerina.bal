import ballerina/io;

function insertionSort(float[] bucket) returns float[] {
    int n = bucket.length();
    foreach int i in 1..<n {
        float key = bucket[i];
        int j = i - 1;
        while j >= 0 && bucket[j] > key {
            bucket[j + 1] = bucket[j];
            j -= 1;
        }
        bucket[j + 1] = key;
    }
    return bucket;
}

function bucketSort(float[] arr) returns float[] {
    int n = arr.length();
    if n == 0 { return arr; }
    float minV = arr[0];
    float maxV = arr[0];
    foreach float v in arr {
        if v < minV { minV = v; }
        if v > maxV { maxV = v; }
    }
    float[][] buckets = [];
    foreach int i in 0..<n {
        buckets.push([]);
    }
    foreach float num in arr {
        int idx = <int>((num - minV) / (maxV - minV + 1) * n);
        if idx >= n { idx = n - 1; }
        buckets[idx].push(num);
    }
    float[] result = [];
    foreach float[] bucket in buckets {
        float[] sorted = insertionSort(bucket);
        foreach float v in sorted { result.push(v); }
    }
    return result;
}

public function main() {
    float[] data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
    io:println(bucketSort(data));
}
