import ceylon.collection { ArrayList }

void insertionSort(ArrayList<Float> bucket) {
    value n = bucket.size;
    for (i in 1..n-1) {
        value key = bucket.get(i) else 0.0;
        variable Integer j = i - 1;
        while (j >= 0 && (bucket.get(j) else 0.0) > key) {
            bucket.set(j + 1, bucket.get(j) else 0.0);
            j--;
        }
        bucket.set(j + 1, key);
    }
}

Float[] bucketSort(Float[] arr) {
    value n = arr.size;
    if (n == 0) { return arr; }
    variable value minV = arr.first else 0.0;
    variable value maxV = arr.first else 0.0;
    for (v in arr) {
        if (v < minV) { minV = v; }
        if (v > maxV) { maxV = v; }
    }
    value buckets = ArrayList<ArrayList<Float>> {
        elements = { for (i in 0..n-1) ArrayList<Float>() }
    };
    for (num in arr) {
        variable value idx = (num - minV) / (maxV - minV + 1) * n;
        value idxInt = idx.integer;
        value safeIdx = if (idxInt >= n) then n - 1 else idxInt;
        buckets.get(safeIdx)?.add(num);
    }
    value result = ArrayList<Float>();
    for (bucket in buckets) {
        insertionSort(bucket);
        result.addAll(bucket);
    }
    return result.sequence();
}

shared void run() {
    value data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
    print(bucketSort(data));
}
