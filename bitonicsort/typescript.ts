function compareAndSwap(arr: number[], i: number, j: number, direction: boolean): void {
    if (direction === arr[i] > arr[j]) {
        [arr[i], arr[j]] = [arr[j], arr[i]];
    }
}

function bitonicMerge(arr: number[], lo: number, cnt: number, direction: boolean): void {
    if (cnt > 1) {
        const k = Math.floor(cnt / 2);
        for (let i = lo; i < lo + k; i++) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

function bitonicSort(arr: number[], lo: number, cnt: number, direction: boolean): void {
    if (cnt > 1) {
        const k = Math.floor(cnt / 2);
        bitonicSort(arr, lo, k, true);
        bitonicSort(arr, lo + k, k, false);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

function sort(arr: number[]): number[] {
    bitonicSort(arr, 0, arr.length, true);
    return arr;
}

const data: number[] = [3, 7, 4, 8, 6, 2, 1, 5];
console.log(sort(data));
