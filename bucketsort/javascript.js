function insertionSort(bucket) {
    for (let i = 1; i < bucket.length; i++) {
        let key = bucket[i];
        let j = i - 1;
        while (j >= 0 && bucket[j] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = key;
    }
    return bucket;
}

function bucketSort(arr) {
    if (arr.length === 0) return arr;
    const min = Math.min(...arr);
    const max = Math.max(...arr);
    const n = arr.length;
    const buckets = Array.from({ length: n }, () => []);
    for (const num of arr) {
        const idx = Math.floor(((num - min) / (max - min + 1)) * n);
        buckets[idx].push(num);
    }
    return buckets.flatMap(insertionSort);
}

console.log(bucketSort([0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]));
