function stoogeSort(arr: number[], first: number, last: number): void {
    if (arr[first] > arr[last]) {
        [arr[first], arr[last]] = [arr[last], arr[first]];
    }
    if (last - first + 1 > 2) {
        const t = Math.floor((last - first + 1) * 2 / 3);
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

const arr: number[] = [3, 1, 4, 1, 5, 9, 2, 6];
stoogeSort(arr, 0, arr.length - 1);
console.log(arr);
