function bucketSort(arr: number[]): number[] {
    if (arr.length === 0) return arr;
    const minVal = Math.min(...arr);
    const maxVal = Math.max(...arr);
    if (minVal === maxVal) return arr;
    const bucketCount = arr.length;
    const bucketRange = (maxVal - minVal) / bucketCount;
    const buckets: number[][] = Array.from({length: bucketCount}, () => []);
    for (let num of arr) {
        const bucketIdx = num === maxVal ? bucketCount - 1 : Math.floor((num - minVal) / bucketRange);
        buckets[bucketIdx].push(num);
    }
    for (let bucket of buckets) {
        bucket.sort((a, b) => a - b);
    }
    return buckets.flat();
}
