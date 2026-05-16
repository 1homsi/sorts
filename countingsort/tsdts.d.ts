function countingSort(arr) {
    if (arr.length === 0) return arr;
    const max = Math.max(...arr), min = Math.min(...arr);
    const range = max - min + 1;
    const count = new Array(range).fill(0);
    for (const v of arr) count[v - min]++;
    for (let i = 1; i < range; i++) count[i] += count[i - 1];
    const output = new Array(arr.length);
    for (let i = arr.length - 1; i >= 0; i--) {
        output[--count[arr[i] - min]] = arr[i];
    }
    return output;
}
console.log(countingSort([4, 2, 2, 8, 3, 3, 1]));
